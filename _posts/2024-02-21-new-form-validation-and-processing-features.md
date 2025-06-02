---
title: "New Form Validation and Processing Features"
tags: [features]
categories: [Updates, Forms]
---

TL;DR: Form Specifications enable validation and processing of incoming messages.

With form specifications, it's easy to validate and process incoming messages. Soon you will also be able to embed the form, for easier maintenance.

- Share your form without giving access to your account
- Check it into a versioning system / backup
- Generate HTML forms directly
- Totally optional

Here's what a form specification looks like:

```toml
[first_name]
name = 'first_name'
field = 'text'
label = 'First Name'
placeholder = 'Mike'
required = true

[last_name]
name = 'last_name'
field = 'text'
label = 'Last Name'
placeholder = 'Doe'
required = true

[email]
name = 'email'
field = 'text'
label = 'Email'
placeholder = 'mike.doe@gmail.com'
is_email = true
required = true

[phone]
name = 'phone'
field = 'text'
label = 'Phone'
placeholder = '123-456-7890'

[message]
name = 'message'
field = 'textarea'
label = 'Message'
placeholder = 'Message'
required = true
check_spam = true
is_min = 5
on_fail = 'spam'

[kind_of_inquiry]
name = 'kind_of_inquiry'
field = 'select'
label = 'Kind of Inquiry'
options = 'General Inquiry,Technical Support,Partnership,Other'
required = true

[respond_by]
name = 'respond_by'
field = 'checkbox'
label = 'Respond by'
options = 'Email,Phone'

[settings]
discard_additional_fields = false
```

I don't want to bore you with all the details, so here's a quick run-down of the important stuff:

- `name` is the name of the field
- `field` is the type of field (text, textarea, select, checkbox, ...)
- `label` is the label of the field (HTML)
- `placeholder` is the placeholder of the field (HTML)
- `required` is a boolean that indicates if the field is required (HTML)

Some of these fields are only applicable (and thus optional), if you want to generate HTML forms from your specification. The `label`, `placeholder`, and `required` fields are primarily used to generate the HTML.

For easier validation, there's a bunch of helpers:

- `is_email` checks if the field is a valid email
- `is_min` checks if the field has a minimum length (or amount)
- `is_max` checks if the field has a maximum length (or amount)
- `check_spam` checks if the field is spam - this should only be used once
- `options` is a list of valid options for the select and checkbox fields

All these don't do much, unless you enforce them. This is where the `on_fail` field comes into play. It's a string that indicates what to do, if the validation fails. The default is to do nothing, but you can also discard the message or mark it as spam.

- `on_fail` is a string that indicates what to do, if the validation fails
  - `spam` marks the message as spam
  - `trash` moves the message to the trash
  - `reject` rejects the message (this will trigger a 401: bad request error)
  - `pass` does nothing

The `discard_additional_fields` field is a boolean that indicates if additional fields should be discarded. This is useful, if you want to prevent spam messages with additional fields. This field is required.