---
title: "[Forms] New Python Library"
tags: [python, library]
categories: [Updates, Forms]
---

TL;DR: The first release of our Python library is now available.

Data in isolation isn't very useful, nor valuable - today we're introducing the `v0.0.1` release of the Rusty Forms python library. This library is designed to help you

- Integrate with other applications
- Retrieve data from Rusty Forms
- Automate stuff (create new forms, integrations, ...)

For example, you can use the library, to update the form specifications, whenever you push to a Github repo - cool, right?

Here's a quick look, at how-to sign-up and create a form:

## Installation

This works everywhere, python works:

```bash
pip install https://github.com/Rusty-Stuff/python-library
```

## Usage


#### Login (& Signup)

{% include init_python_library.md %}

#### Create a new form

```python
new_form = api.create_form({
    "title": "My Form",
})
```

#### Get form messages

```python
messages = api.get_form_messages(new_form["id"])
```

#### Update form

```python
title = "My Form with Specs"
specs = r"""
    [first_name]
    name = "first_name"
    field = "text"
    required = true

    [last_name]
    name = "last_name"
    field = "text"
    required = true

    [message]
    name = "message"
    field = "textarea"
    required = true
    check_spam = true

    [settings]
    discard_additional_fields = true
"""
check_specs = True
filter_spam = True
redirect_url = "https://rusty-stuff.com"

api.update_form(new_form["id"], {
    "title": title,
    "specs": specs,
    "check_specs": check_specs,
    "filter_spam": filter_spam,
    "redirect_url": redirect_url,
})
```

The forms URL looks like this:

```python
f"https://api.rusty-forms.com/v1/digest/{new_form["id"]}"
```

It accepts:

- JSON
- URL Encoded
- Multipart

#### Check Balance

```python
balance = api.account_balance()
```

## Caution

This library will save your private key in a file. Feel free to supplement a more secure storage option such as your keychain, and pass the key to the library:

```python
from nostr.key import PrivateKey
from rusty_forms import NostrAuthApiConfig

# your own method to get the key
private_key = PrivateKey(key)
auth = NostrAuthApiConfig(private_key=private_key)
```

## More information and source code

You can find the source code on [Github](https://github.com/Rusty-Stuff/python-library) with more up to date examples and documentation.