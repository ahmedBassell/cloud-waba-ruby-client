# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

require_relative "utils"
require_relative "http_client"
# models
require_relative "models/config"
# services
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
