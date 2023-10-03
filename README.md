# cloud-waba-ruby-client

Ruby wrapper for [Cloud WhatsApp Business API](https://developers.facebook.com/docs/whatsapp/cloud-api).

<!-- ## Installation

Add following line to your Gemfile:

```ruby
gem 'cloud-waba-ruby-client', '~> 1.0'
``` -->
## Setup
1. Make sure you have
  - Meta business app
  - WhatsApp Business account
  - A phone number added to your WhatsApp business account
  - Meta developer app
2. Add following environment variables to your `.env` file:
  ```shell
  WA_BASE_URL=https://graph.facebook.com
  CLOUD_API_VERSION=v16.0
  M4D_APP_ID=
  M4D_APP_SECRET=
  WA_PHONE_NUMBER_ID=
  WA_BUSINESS_ACCOUNT_ID=
  CLOUD_API_ACCESS_TOKEN=
  ```
Fill credentials for your meta developer app, business account and phone number ids.

## Usage
### Sending template message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_template(recipient: "+201XXXXXXXXX", template_name: "hello_world", template_lang: "en_US", components: [])
```

### Sending text message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_text(body: "Hello World!", recipient: "+201XXXXXXXXX")
```
<!-- ### Sending template with header, body, footer and buttons

### Sending template with header, body, footer and buttons (variables)

### Sending audio
### Sending video
### Sending image
### Sending location
### Sending contact -->




## Templates

### Creating a template
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.templates.create(name: "welcome", category: ::CloudWaba::Models::Enums::Templates::Category::Utility, language: "en", components: [::CloudWaba::Models::Templates::BodyComponent.new(text: "Welcome to our store!, how can we help?")])
```

### Creating a template with header, body and footer components with variables
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
category = ::CloudWaba::Models::Enums::Templates::Category::Marketing
language = "en"

header_text = "Hi {{1}}!"
header_example = ::CloudWaba::Models::Templates::Example.new(values: ["ahmed"])
header_component = ::CloudWaba::Models::Templates::HeaderTextComponent.new(text: header_text, example: header_example)

body_text = "We offer {{1}} discount!"
body_example = ::CloudWaba::Models::Templates::Example.new(values: ["20%"])
body_component = ::CloudWaba::Models::Templates::BodyComponent.new(text: body_text, example: body_example)

footer_text = "Petitux Team"
footer_component = ::CloudWaba::Models::Templates::FooterComponent.new(text: footer_text)

client.templates.create(name: "discount", category: category, language: language, components: [header_component, body_component, footer_component])
```

### Update Template
```ruby
client = CloudWaba::Client.new

category = ::CloudWaba::Models::Enums::Templates::Category::Utility
body_text = "Your order no. {{1}} has been placed!"
body_example = ::CloudWaba::Models::Templates::Example.new(values: ["500"])
body_component = ::CloudWaba::Models::Templates::BodyComponent.new(text: body_text, example: body_example)

client.templates.update(template_id: "1027873614915405", category: category, components: [body_component])
```

### Delete Template
```ruby
client = CloudWaba::Client.new
client.templates.delete(name: "discount")
```

<!-- ### Creating a template with header, body, footer and buttons

### Listing templates

### Sending template with header, body, footer and buttons

### Sending template with header, body, footer and buttons (variables) -->