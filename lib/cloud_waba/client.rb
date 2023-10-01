# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

# Enums
require_relative "models/enums/messaging_product"
require_relative "models/enums/templates/category"
require_relative "models/enums/templates/component_type"
# Models
require_relative "models/config"
require_relative "models/contact"
require_relative "models/messages/response"

require_relative "models/templates/component"
require_relative "models/templates/header_component"
require_relative "models/templates/body_component"
require_relative "models/templates/footer_component"
require_relative "models/templates/buttons_component"
require_relative "models/templates/message_template"
require_relative "models/templates/response"
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

    def initialize
      @config = ::CloudWaba::Utils.import_config
    end

    def messages
      ::API::Messages::Service.new(config: @config)
    end

    def templates
      ::API::Templates::Service.new(config: @config)
    end
  end
end
