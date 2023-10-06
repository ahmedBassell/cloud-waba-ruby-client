# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

# Enums
require_relative "models/enums/messaging_product"
require_relative "models/enums/templates/category"
require_relative "models/enums/templates/component_type"
require_relative "models/enums/templates/button_type"
require_relative "models/enums/templates/format"
require_relative "models/enums/contact_phone_type"

# Models
require_relative "models/config"
require_relative "models/contact"
require_relative "models/messages/response"
require_relative "models/messages/contact_name"
require_relative "models/messages/contact_phone"
require_relative "models/messages/contact"

require_relative "models/templates/example"
require_relative "models/templates/component"
require_relative "models/templates/header_text_component"
require_relative "models/templates/header_media_component"
require_relative "models/templates/header_location_component"
require_relative "models/templates/body_component"
require_relative "models/templates/footer_component"
require_relative "models/templates/button"
require_relative "models/templates/buttons/copy_code"
require_relative "models/templates/buttons/otp"
require_relative "models/templates/buttons/phone_number"
require_relative "models/templates/buttons/quick_reply"
require_relative "models/templates/buttons/url"
require_relative "models/templates/buttons_component"
require_relative "models/templates/message_template"
require_relative "models/templates/response"
require_relative "models/templates/list"

# Errors
require_relative "errors/unauthorized"
require_relative "errors/bad_request"

# Helpers
require_relative "utils"
require_relative "http_client"
# Services
require_relative "../api/messages/service"
require_relative "../api/templates/service"

module CloudWaba
  class Client
    extend ::T::Sig
    extend ::T::Helpers

    attr_reader :config

    sig do
      params(
        app_id: ::T.nilable(::String),
        app_secret: ::T.nilable(::String),
        phone_number_id: ::T.nilable(::String),
        business_account_id: ::T.nilable(::String),
        access_token: ::T.nilable(::String),
        api_version: ::T.nilable(::String)
      ).void
    end
    def initialize(
      app_id: nil,
      app_secret: nil,
      phone_number_id: nil,
      business_account_id: nil,
      access_token: nil,
      api_version: nil
    )
      @config = ::CloudWaba::Utils.import_config(
        app_id: app_id,
        app_secret: app_secret,
        phone_number_id: phone_number_id,
        business_account_id: business_account_id,
        access_token: access_token,
        api_version: api_version
      )
    end

    def messages
      ::API::Messages::Service.new(config: @config)
    end

    def templates
      ::API::Templates::Service.new(config: @config)
    end
  end
end
