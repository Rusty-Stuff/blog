---
title: "April Release"
tags: [features]
categories: [Release, Forms]
---

TL;DR: Added login with Google, improved API response times and fixed some bugs.

## Google Login

Google login is now available on Formshive:

- This is for new users only; You cannot switch between (for ex.) Magic Link and Google
- If your Google Email is verified, Rusty will mark it verified automatically

## Misc Fixes

- API access for logged-in users is up to twice as fast now (> 60ms).
- Sign-up and login is more clear now.
- The balance wouldn't show on the profile page. This has been fixed.
- Handling of expired sessions has been improved.