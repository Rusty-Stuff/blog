---
title: "New Form Captcha Features"
tags: [pow, captcha]
categories: [Release, Forms]
---

## Protect your forms with a captcha

There's been a lot of interest for captcha support on Formoxy. So far we didn't consider adding this, because there's no good solutions on the market apart from Google reCaptcha and hCaptcha - both of which are usability and privacy nightmares.

A few days ago I came across Altcha, a open source captcha solution that relies on proof of work. This means, there's no need to track users, or force them to solve annoying puzzles - instead, we have their computer solve a simple math problem. Like other solutions, this is not bullet proof, but it's effective and cheaper than a spam check.

### HTML Form

To activate the captcha for your form, you need to do 3 things:

1. Enable the captcha in the form settings
2. Load the script on your website


```html
<script async defer src="https://cdn.jsdelivr.net/npm/altcha/dist/altcha.min.js" type="module"></script>
```

3. Embed the captcha on your website

```html
<form action="https://api.formoxy.com/v1/digest/75abad84-7a8d-4075-b18f-cd35954b9df6" method="POST">
  <label for="email">Email:</label><br>
  <input type="email" id="email" name="email" value="your-email@gmail.com"><br>
  <label for="name">Name:</label><br>
  <input type="text" id="name" name="name" value="Mike"><br>
  <label for="message">Message:</label><br>
  <textarea id="message" name="message">Hi, I want to enquire about ....</textarea><br>

  <!-- Add the captcha widget anywhere between the form tags -->
  <altcha-widget
    challengeurl=https://api.formoxy.com/v1/forms/75abad84-7a8d-4075-b18f-cd35954b9df6/challenge/altcha
    hidefooter
    hidelogo
  ></altcha-widget>
  <!-- End of captcha widget -->

  <input type="submit" value="Submit">
</form>
```

Make sure that `altcha-widget` sit's between the `form` tags, and that the `challengeurl` points to the correct address.

### React, Vue and others

Here's an example how'to use the captcha in React:

1. Enable the captcha in the form settings
2. Install the package `npm install altcha`
3. Load the script on your website `import 'altcha'`
4. Embed the captcha on your website


```javascript
import {
  TextInput,
  Textarea,
  Button,
} from '@mantine/core';
import 'altcha'

export function MyForm() {
  const formUrl = 'https://api.formoxy.com/v1/digest/75abad84-7a8d-4075-b18f-cd35954b9df6'
  const challengeUrl = 'https://api.formoxy.com/v1/forms/75abad84-7a8d-4075-b18f-cd35954b9df6/challenge/altcha'

  return (
    <form action={formUrl} method="POST">
      <TextInput
        label="Email"
        type="email"
        id="email"
        name="email"
        placeholder="your-email@gmail.com"
      />
      <TextInput label="Name" type="text" id="name" name="name" placeholder="Mike" />
      <Textarea
        label="Message"
        id="message"
        name="message"
        placeholder="Hi there, I'm looking to renovate my living room and was told you're the person to contact. Let's have a call to discuss."
        mb='md'
      />
      <altcha-widget
        challengeurl={challengeUrl}
        hidefooter
        hidelogo
      ></altcha-widget>
      <Button type="submit" value="Submit" mt="xs">
        Submit
      </Button>
    </form>
  )
}
```

If you're using Typescript, you might have to declare the component in your `d.ts` file:

```ts
declare namespace JSX {
    interface IntrinsicElements {
        'altcha-widget': any;
    }
}
```

## What to expect

If you want to give it a try, checkout the captcha on our homepage [formoxy.com](https://formoxy.com).

- This feature is free to use for all Formoxy users
- You will not be charged for messages that do not pass the captcha
- Messages that do not pass the captcha, are rejected and not stored
- This feature is fully GDPR compliant

> The self-hosted ALTCHA is fully compliant with GDPR by design and without the need to update your privacy policy as it doesn’t use cookies or external services.

## More about Altcha

If you are curious, you can find out more about Altcha on their [GitHub page](https://github.com/altcha-org/altcha).