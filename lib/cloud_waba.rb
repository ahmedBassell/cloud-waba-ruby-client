# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "utils"
require_relative "http_client"
# Enums
require_relative "models/enums/messaging_product"
# Models
require_relative "models/config"
require_relative "models/contact"
require_relative "models/messages/response"
require_relative "models/templates/component"
# Services
require_relative "api/messages/service"

class CloudWaba
  extend ::T::Sig
  extend ::T::Helpers

  def initialize
    @config = ::Utils.import_config
  end

  def messages
    ::API::Messages::Service.new(config: @config)
  end
end
