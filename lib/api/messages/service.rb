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
        params(body: ::String, recipient: ::String, reply_message_id: ::T.nilable(::String)).void
      end
      def send_text_message(body:, recipient:, reply_message_id:)
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

        response = http_client.post(body: payload)
      end

      private

      def http_client
        HttpClient.new(base_url: messages_endpoint, auth_token: @config.access_token)
      end

      def messages_endpoint
        "#{@config.base_url}/#{config.phone_number_id}/messages"
      end
    end
  end
end