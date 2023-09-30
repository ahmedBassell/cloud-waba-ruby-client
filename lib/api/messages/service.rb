# typed: true
# frozen_string_literal: true

module API
  module Messages
    class Service
      extend ::T::Sig
      extend ::T::Helpers

      MESSAGING_PRODUCT = ::T.let("whatsapp", ::String)
      RECIPIENT_TYPE = ::T.let("individual", ::String)

      def initialize(config:)
        @config = config
      end


      sig do
        params(body: ::String, recipient: ::String, reply_message_id: ::T.nilable(::String)).returns(::Models::Messages::Response)
      end
      def send_text(body:, recipient:, reply_message_id: nil)
        text_type = "text"
        enable_preview = false

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": text_type,
          "text": {
            "preview_url": enable_preview,
            "body": body
          }
        }

        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = http_client.post(body: payload, headers: {})
        ::Models::Messages::Response.parse(response: response)
      end

      private

      def http_client
        ::HttpClient.new(base_url: messages_endpoint, auth_token: @config.access_token)
      end

      def messages_endpoint
        "#{@config.base_url}/#{@config.phone_number_id}/messages"
      end
    end
  end
end