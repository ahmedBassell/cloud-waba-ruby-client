# cloud-waba-ruby-client

Ruby wrapper for [Cloud WhatsApp Business API](https://developers.facebook.com/docs/whatsapp/cloud-api).

## Installation

Add following line to your Gemfile:

```ruby
gem 'cloud-waba-ruby-client', '~> 0.0.5'
```

then run

```shell
bundle
```

or install it yourself as:

```shell
gem install cloud-waba-ruby-client
```

## Setup
1. Make sure you have:
  - Meta business app
  - WhatsApp Business account
  - A phone number added to your WhatsApp business account
  - Meta developer app
### Initiating clients using parameters
```ruby
require "cloud_waba/client"
client_1 = CloudWaba::Client.new(
  app_id: param_app_id_1,
  app_secret: param_app_secret_1,
  phone_number_id: param_phone_number_id_1,
  business_account_id: param_business_account_id_1,
  access_token: param_access_token_1,
  api_version: param_api_version_1
)

client_2 = CloudWaba::Client.new(
  app_id: param_app_id_2,
  app_secret: param_app_secret_2,
  phone_number_id: param_phone_number_id_2,
  business_account_id: param_business_account_id_2,
  access_token: param_access_token_2,
  api_version: param_api_version_2
)

# Do somethingn with the clients
```
### Initiating client using Env variables
Add following environment variables to your `.env` file:
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
```ruby
require "cloud_waba/client"
client = CloudWaba::Client.new # If no params provided, configuration will fallback to env variables
```
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

### Sending image message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_image(caption: "Nice caption for image!", link: "https://picsum.photos/200/300",recipient: "+201XXXXXXXXX")
```

### Sending audio message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_audio(link: "https://samplelib.com/lib/preview/mp3/sample-3s.mp3",recipient: "+201XXXXXXXXX")
```

### Sending video message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_video(caption: "Nice caption for video!", link: "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",recipient: "+201XXXXXXXXX")
```

### Sending document message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_document(caption: "Nice caption for doc!", link: "https://download.samplelib.com/xls/sample-empty.xls",recipient: "+201XXXXXXXXX")
```

### Sending location message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.messages.send_location(longitude: 30.0849643, latitude: 31.2913638, name: "Cairo University", address: "1 شارع الجامعة, Giza Governorate 12613", recipient: "+201XXXXXXXXX")
```

### Sending contact message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
name = ::CloudWaba::Models::Messages::ContactName.new(formatted_name: "Ahmed Ali", first_name: "Ashley")
phone_1 = ::CloudWaba::Models::Messages::ContactPhone.new(type: ::CloudWaba::Models::Enums::ContactPhoneType::Cell, phone: "+201XXXXXXXXX")
contacts = [::CloudWaba::Models::Messages::Contact.new(name: name, phones: [phone_1])]
client.messages.send_contact(contacts: contacts,recipient: "+201XXXXXXXXX")
```

### Sending reaction on a message
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
 client.messages.send_reaction(recipient: "+201XXXXXXXXX", emoji: "💙", reply_message_id: "wamid.HBgMMjAxMjAxMzIyMzMxFQIAEZgSQTU5QkExMUUyQlRCNTU1NTVEAA==")
```
<!-- ### Sending template with header, body, footer and buttons

### Sending template with header, body, footer and buttons (variables)
 -->




### Listing templates
```ruby
require "cloud_waba/client"
client = CloudWaba::Client.new
client.templates.list(limit: 5)
```
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

### Sending template with header, body, footer and buttons

### Sending template with header, body, footer and buttons (variables) -->