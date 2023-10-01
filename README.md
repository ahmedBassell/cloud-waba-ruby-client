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

### Creating a template
```ruby
require "cloud_waba/client"

client = CloudWaba::Client.new
client.templates.create(name: "welcome", category: ::CloudWaba::Models::Enums::Templates::Category::Utility, language: "en", components: [::CloudWaba::Models::Templates::BodyComponent.new(text: "Welcome to our store!, how can we help?")])
```
