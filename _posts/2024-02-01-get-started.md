---
title: "Get Started"
tags: [nostr, register, signup, login]
categories: [How-To, Forms]
---

TL;DR: Sign-up with a email link or use the browser extension.

## Sign-up: Email Link

For most users, the sign-up with a email link, is the easiest way to get started:

1. Enter your Email address and "Submit"
2. Click the link in the email, or copy the code
3. You're loogged in!

## Sign-up: Browser Extension

Alternatively, you can use the browser extension to sign-up and login. This is a more secure way to authenticate, and provides a number of benefits.

- Securely login to many services, with one key
- Significantly more secure because we never save your password
- No need for an email to get started

Instead of a username and password, you have a public and private key. The public key identifies you, and the private key (secret) authenticates you.

```
username = public key
password = private key
```

### Steps

To generate and store your public and private key, a browser extension is required. This extension is available for Firefox and Chrome.

- Firefox Extension: [nos2x-fox](https://addons.mozilla.org/en-US/firefox/addon/nos2x-fox/)
- Chrome Extension: [nos2x](https://chromewebstore.google.com/detail/nos2x/kpgefcfmnafjgpblomihpgmejjdanjjp)

The Firefox and Chrome extensions code is public and open source. In the next steps, we'll use the Chrome extension:

![](/assets/images/chrome-setup-1.png)

Add the extension.

![](/assets/images/chrome-setup-2.png)

Open the extension options page, to generate your keys.

![](/assets/images/chrome-setup-3.png)

Click the "Generate" button to generate your private key. Your public key is derrived from your private key, so there's nothing else to do here.

If you wanted to make a backup, now's a good opportunity. You could store your private key in a password manager, or print it out and store it in a safe place. If you decide to store a backup in a password manager, consider an offline password manager, such as [KeePassXC](https://keepassxc.org/).

![](/assets/images/chrome-setup-4.png)

Now you can open a new tab, and go to the login page at [https://formoxy.com/#/login](https://formoxy.com/#/login).
<br/>**Registration**: You **do not** need to register.

Click on "Get public key from extension".

_If you get an error message, reload the page to make sure the extension is loaded._

![](/assets/images/chrome-setup-5.png)

Authorize "just this" or "forever" and then "Submit".

![](/assets/images/chrome-setup-6.png)

Final step, authentication: Think of this, as the password prompt.

Authorize "just this" or "forever" and then "Submit".

![](/assets/images/chrome-setup-7.png)

Welcome.

![](/assets/images/chrome-setup-8.png)

### A couple of points

- The extension will remember your private key
- Make sure you have a backup
- You can copy the private key to other devices, to login from there

## Integrate Formoxy with your website

Once you're logged-in, and created your first form, you will see examples on how-to integrate it.

### Example: HTML form

Here's what a simple HTML form may look like:

```html
<form action="https://api.formoxy.com/v1/digest/821f4a10-127c-46c6-bc80-8790d219575a" method="POST" enctype="application/x-www-form-urlencoded">
  <label for="email">Email:</label><br>
  <input type="email" id="email" name="email" value="your-email@gmail.com"><br>
  <label for="name">Name:</label><br>
  <input type="text" id="name" name="name" value="Mike"><br>
  <label for="message">Message:</label><br>
  <textarea id="message" name="message">Hi, I want to enquire about ....</textarea><br>
  <label for="products">Send me more info about:</label><br>
  <input type="checkbox" id="productA" name="products[]" value="Product A">
  <label for="productA">Product A</label><br>
  <input type="checkbox" id="productB" name="products[]" value="Product B">
  <label for="productB">Product B</label><br>
  <input type="checkbox" id="productC" name="products[]" value="Product C">
  <label for="productC">Product C</label><br>
  <input type="submit" value="Submit">
</form>
```

This is the preview, of the above form:

<form action="https://api.formoxy.com/v1/digest/821f4a10-127c-46c6-bc80-8790d219575a" method="POST" enctype="application/x-www-form-urlencoded">
  <label for="email">Email:</label><br>
  <input type="email" id="email" name="email" value="your-email@gmail.com"><br>
  <label for="name">Name:</label><br>
  <input type="text" id="name" name="name" value="Mike"><br>
  <label for="message">Message:</label><br>
  <textarea id="message" name="message">Hi, I want to enquire about ....</textarea><br>
  <label for="products">Send me more info about:</label><br>
  <input type="checkbox" id="productA" name="products[]" value="Product A">
  <label for="productA">Product A</label><br>
  <input type="checkbox" id="productB" name="products[]" value="Product B">
  <label for="productB">Product B</label><br>
  <input type="checkbox" id="productC" name="products[]" value="Product C">
  <label for="productC">Product C</label><br>
  <input type="submit" value="Submit">
</form>


### Links with more information

- [Form Captcha Features](/posts/new-form-captcha-features/)
- [Use Captcha with Nuxt And SSR](/posts/use-captcha-with-nuxt-and-ssr/)
- [Form Validation and Processing](/posts/new-form-validation-and-processing-features/)

---

**EDIT: 2024-11-13**

This post was revised to 
- mention recently added authentication methods
- make it easier, to add the first form to your website