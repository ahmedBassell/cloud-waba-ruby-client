# typed: true
# frozen_string_literal: true

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
        params(limit: T.nilable(::Integer)).returns(::CloudWaba::Models::Templates::List)
      end
      def list(limit: 20)
        fields = "id,name,category,language,status"
        response = with_error_handling { templates_client.get(params: { fields: fields, limit: limit }) }

        parsed_response = JSON.parse(response.body.to_s)
        templates = parsed_response["data"].map{|hash| ::CloudWaba::Models::Templates::Response.parse(template_hash: hash)}
        ::CloudWaba::Models::Templates::List.new(templates: templates, paging: parsed_response["paging"])
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

        response = with_error_handling { templates_client.post(body: payload) }
        ::CloudWaba::Models::Templates::Response.parse(response: response)
      end

      sig do
        params(
          template_id: ::String,
          category: ::CloudWaba::Models::Enums::Templates::Category,
          components: ::T::Array[::CloudWaba::Models::Templates::Component]
        ).returns(::T::Boolean)
      end
      def update(template_id:, category:, components:)
        template_client = template_endpoint(template_id: template_id)
        payload = {
          "category": category.serialize,
          "components": components.map(&:serialize)
        }
        response = with_error_handling { client.post(body: payload) }
        parsed_response = JSON.parse(response.body.to_s)

        parsed_response["success"] || false
      end

      sig do
        params(
          name: ::String,
          template_id: ::T.nilable(::String)
        ).returns(::T::Boolean)
      end
      def delete(name:, template_id: nil)
        params = { name: name }
        params[:hsm_id] = template_id unless template_id.nil?

        response = with_error_handling { templates_client.delete(params: params) }
        parsed_response = JSON.parse(response.body.to_s)
        
        parsed_response["success"] || false
      end

      private

      def templates_client
        ::CloudWaba::HttpClient.new(base_url: templates_endpoint, auth_token: @config.access_token)
      end

      def template_endpoint(template_id:)
        ::CloudWaba::HttpClient.new(base_url: template_endpoint(template_id: template_id), auth_token: @config.access_token)
      end

      def templates_endpoint
        "#{@config.base_url}/#{@config.api_version}/#{@config.business_account_id}/#{MESSAGE_TEMPLATES_PATH}"
      end

      def template_endpoint(template_id:)
        "#{@config.base_url}/#{@config.api_version}/#{template_id}"
      end

      def with_error_handling
        return unless block_given?

        response = yield
        parsed_response = JSON.parse(response.body.to_s)
        error_message = parsed_response.dig("error", "message")

        case response.code
        when 400
          raise ::CloudWaba::Errors::BadRequest, error_message
        when 401
          raise ::CloudWaba::Errors::Unauthorized, error_message
        else
          # Success
        end

        response
      end
    end
  end
end