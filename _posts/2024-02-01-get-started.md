---
tags: [nostr, register, signup, login]
categories: [How-To]
---

## Basics

Rusty Forms authenticates you differently than what you may be used to. This is to provide you with a number of benefits, such as:

- Securely login to many services, with one key
- Significantly more secure because we never save your password
- No need for an email to get started

Instead of a username and password, you have a public and private key. The public key identifies you, and the private key (secret) authenticates you.

```
username = public key
password = private key
```

## Signup / Login

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

Now you can open a new tab, and go to the login page at [https://rusty-forms.com/#/login](https://rusty-forms.com/#/login).
<br/>**Registration**: You **do not** need to register. Trust the process and continue :)

Click on "Get public key from extention".

![](/assets/images/chrome-setup-5.png)

Authorize "just this" or "forever" and then "Submit".

![](/assets/images/chrome-setup-6.png)

Final step, authentication: Think of this, as the password prompt.

Authorize "just this" or "forever" and then "Submit".

![](/assets/images/chrome-setup-7.png)

Welcome.

![](/assets/images/chrome-setup-8.png)

## A couple of points

- The extention will remember your private key
- Make sure you have a backup
- You can copy the private key to other devices, to login from there
