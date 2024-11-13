---
tags: [pow, captcha, nuxtjs, ssr]
categories: [How-To]
---

This is a follow-up to [New Form Captcha Features](/posts/new-form-captcha-features/), to integrate the Altcha captcha on Nuxt.js with SSR (server side rendering) enabled. If you are looking to integrate a captcha with React, Vue or others, please refer to this previous post.

## Implementation

To use the capcha with Nuxt.js (v2) and SSR (server side rendering), some additional work is needed because Altcha is designed to work in the browser.

##### 1. Load the Altcha Library

Create a new plugin file `plugins/altcha.client.ts`:

```js
import 'altcha'
```

##### 2. Configure Nuxt.js

Extend your `nuxt.config.ts`:

```js
[
  // other settings
  plugins: [
    { src: '~/plugins/altcha.client', mode: 'client' },
  ],
  build: {
    transpile: [
      'altcha',
    ],
  },
]
```

##### 3. Embed the Captcha

Add the Captcha to your component:

```vue
<template>
  <ValidationObserver ref="observer" v-slot="{ handleSubmit }">
    <ValidationProvider v-slot="{ errors, valid }" rules="required" name="firstName">
      <b-field
        label="First Name*"
        :type="{
          'is-danger': errors[0],
          'is-success': valid,
        }"
        :message="errors"
      >
        <b-input v-model="form.firstName" placeholder="Mike" />
      </b-field>
    </ValidationProvider>

    <ClientOnly>
      <altcha-widget
        ref="altchaWidget"
        :challengeurl="challengeUrl"
        hidefooter
        hidelogo
        @statechange="handleAltchaStateChange"
      ></altcha-widget>
    </ClientOnly>

    <b-button type="is-primary" style="margin-top: 1rem" @click="handleSubmit(submit)"> Submit </b-button>
  </ValidationObserver>
</template>

<script lang="ts">
import { ref } from 'vue'
import { Vue, Component } from 'nuxt-property-decorator'
import { ValidationProvider, ValidationObserver } from 'vee-validate'

@Component({
  components: {
    ValidationObserver,
    ValidationProvider,
  },
})
export default class ContactForm extends Vue {
  submissionSuccess: boolean = false

  // Replace these URLs with your own
  formUrl = 'https://api.rusty-forms.com/v1/digest/75abad84-7a8d-4075-b18f-cd35954b9df6'
  challengeUrl = 'https://api.rusty-forms.com/v1/forms/75abad84-7a8d-4075-b18f-cd35954b9df6/challenge/altcha'

  // Reference to the altcha widget
  altchaWidget = ref<HTMLElement | null>(null);

  public form = {
    firstName: '',
    // other form fields
    altcha: ''
  }

  // Handle the captcha state change
  handleAltchaStateChange(event: CustomEvent<AltchaState>) {
    if (event.detail.state === 'verified') {
      this.form.altcha = event.detail.payload || '';
    } else {
      this.form.altcha = '';
    }
  }
  
  async mounted() {
    // Add the event listener to the altcha widget
    if (this.altchaWidget && this.altchaWidget.value) {
      (this.altchaWidget.value as any).addEventListener('statechange', this.handleAltchaStateChange);
    }
  }

  beforeDestroy() {
    // Remove the event listener from the altcha widget
    if (this.altchaWidget && this.altchaWidget.value) {
      (this.altchaWidget.value as any).removeEventListener('statechange', this.handleAltchaStateChange);
    }
  }

  async submit() {
    // Check if the captcha is completed
    if (this.form.altcha === '') {
      alert('Please complete the CAPTCHA.')
    }
    await this.$axios.$post(this.formUrl, this.form)
  }
}
</script>
```

This example includes some rudimentary form validation with VeeValidate. You can replace this with your own validation library or custom validation logic.

Steps to be aware of:

- `ClientOnly` tag, to make sure the widget is only rendered on the client side
- `@statechange` event listener, to handle the captcha state change
- `handleAltchaStateChange` method, to update the form field with the captcha token

##### 4. Add Typings

Create a typings.d.ts file in the root of your project:

```ts
interface AltchaState {
	state: 'unverified' | 'verifying' | 'verified' | 'error'
	payload?: string
}

type AltchaStateChangeEvent = CustomEvent<AltchaState>
```

That's it. The Altcha captcha should now work with your Nuxt.js application and SSR enabled.