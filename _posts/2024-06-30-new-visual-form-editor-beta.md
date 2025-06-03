---
title: "New Visual Form Editor Beta"
tags: [features]
categories: [Release, Forms]
---

## Validate and transform your form with specs

Formshive has supported form validation and transformation for quite some time, but so far this feature was only available to users who were comfortable working with TOML (a configuration format). Today I'm excited to announce the beta release of our new form visual editor, which makes it easy to define fields for your forms in a point-and-click interface.

Read more about [Form Validation And Processing Features](/posts/new-form-validation-and-processing-features/)

### Visual Form Editor

Here's what you need to know:

- The visual editor is active by default
- You can toggle back and forth between TOML and the visual editor
- The visual editor does not yet support all features available via TOML interface

Here's the TOML source:

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

[settings]
discard_additional_fields = false
```

... and a preview, of the visual editor:

![Formshive - Form Visual Editor](/assets/images/2024-06-30-new-form-visual-editor-beta_preview.png)

### HTML Preview

Form specifications can also be output to HTML. Here's what the above form looks like:

```html
<form class="rusty-form" id="rusty-form" action="http://localhost:8080/v1/digest/e4b6df85-32eb-4a4a-ac2a-b4bb6bd966cd" method="POST" enctype="application/x-www-form-urlencoded">
  <label for="first_name">First Name</label>
  <input type="text" name="first_name" placeholder="Mike" required/>
  <label for="last_name">Last Name</label>
  <input type="text" name="last_name" placeholder="Doe" required/>
  <label for="email">Email</label>
  <input type="email" name="email" placeholder="mike.doe@gmail.com" required/>
  <label for="phone">Phone</label>
  <input type="text" name="phone" placeholder="123-456-7890" />
  <button type="submit" value="submit">Submit</button>
</form>
```

You can find this preview in your form settings.

### CURL Preview

Form specification can also generate an example CURL command, for easy testing:

```
curl -X POST \
  -d "first_name=Mike" \
  -d "last_name=Doe" \
  -d "email=mike.doe@gmail.com" \
  -d "phone=123-456-7890" \
  http://localhost:8080/v1/digest/e4b6df85-32eb-4a4a-ac2a-b4bb6bd966cd
```

This preview is also available in your form settings.

### Planned Features

There's many more things planned here, aside from polish and bug fixes.

- Embedding the HTML form on your website, for automatic updates
- Including the form captcha automatically, when enabled
- Feature parity with TOML interface