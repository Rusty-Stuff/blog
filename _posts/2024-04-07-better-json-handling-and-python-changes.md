---
title: "Better JSON Handling and Python Changes"
tags: [bash, curl, monitoring]
categories: [Release, Forms]
---

## Website and API

Here's what changed today on [formshive.com](https://formshive.com):

- (1) The form redirect url is now optional

Previously you had to enter a redirect url but some forms don't need these at all, so having to enter it seemed unnecessary.

- (2) Form submissions in JSON format will no longer redirect to the redirect url

Usually form submissions in JSON format come from API backends, or scripts, and a redirection may lead to unwanted behaviour. Other formats like `application/x-www-form-urlencoded` will still redirect to the redirect url.

**Redirect**

```bash
curl -X POST \
  -d "email=your-email@gmail.com" \
  -d "name=Mike" \
  -d "message=Hi, I want to enquire about ...." \
  -d "products[]=Product A" \
  -d "products[]=Product B" \
  https://formshive.com/v1/digest/821f4a10-127c-46c6-bc80-8790d219575a -v

...
> Content-Type: application/x-www-form-urlencoded
>
< HTTP/1.1 302 Found
< location: https://formshive.com
```

**JSON, no redirect**

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"email":"your-email@gmail.com","name":"Mike","message":"Hi, I want to enquire about ....","products":["Product A","Product B"]}' \
  https://formshive.com/v1/digest/821f4a10-127c-46c6-bc80-8790d219575a -v

...
> Content-Type: application/json
>
< HTTP/1.1 201 Created
```

## Python Library v0.1.0+

To support more login methods, I have made minor changes to how you initiate the [python library](/posts/new-python-library/).

#### Old approach

```python
from rusty-forms import RustyAPI, RustyAPIConfig

config = RustyAPIConfig()
config.generate_keys()
config.save()

api = RustyAPI(config)
api.login()
```

#### New approach

{% include init_python_library.md %}