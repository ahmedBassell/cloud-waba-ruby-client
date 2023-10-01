# typed: true
# frozen_string_literal: true

require 'pry'

module API
  module Templates
    class Service
      extend ::T::Sig
      extend ::T::Helpers

      MESSAGE_TEMPLATES_PATH = T.let("message_templates", ::String)

      def initialize(config:)
        @config = config
      end


      sig do
        params(
          name: ::String,
          category: ::CloudWaba::Models::Enums::Templates::Category,
          language: ::String,
          components: ::T::Array[::CloudWaba::Models::Templates::Component]
        ).returns(::CloudWaba::Models::Templates::Response)
      end
      def create(name:, category:, language:, components:)
        allow_category_change = true

        payload = {
          "name": name,
          "category": category.serialize,
          "allow_category_change": allow_category_change,
          "language": language,
          "components": components.map(&:serialize)
        }

        response = http_client.post(body: payload)
        binding.pry
        ::CloudWaba::Models::Templates::Response.parse(response: response)
      end

      private

      def http_client
        ::CloudWaba::HttpClient.new(base_url: templates_endpoint, auth_token: @config.access_token)
      end

      def templates_endpoint
        "#{@config.base_url}/#{@config.api_version}/#{@config.business_account_id}/#{MESSAGE_TEMPLATES_PATH}"
      end
    end
  end
end