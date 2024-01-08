# typed: true
# frozen_string_literal: true

require 'pry'

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
        params(recipient: ::String, body: ::String, reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_text(recipient:, body:, reply_message_id: nil)
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

        response = with_error_handling { http_client.post(body: payload, headers: {}) }

        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(recipient: ::String, caption: ::T.nilable(::String), link: ::String, reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_image(recipient:, caption:, link:, reply_message_id: nil)
        image_type = "image"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": image_type,
        }

        payload["image"] = { link: link, caption: caption }
        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(recipient: ::String, link: ::String, reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_audio(recipient:, link:, reply_message_id: nil)
        audio_type = "audio"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": audio_type,
        }

        payload["audio"] = { link: link }
        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(recipient: ::String, caption: ::T.nilable(::String), link: ::String, reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_video(recipient:, caption:, link:, reply_message_id: nil)
        video_type = "video"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": video_type,
        }

        payload["video"] = { link: link, caption: caption }
        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(recipient: ::String, caption: ::T.nilable(::String), link: ::String, reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_document(recipient:, caption:, link:, reply_message_id: nil)
        document_type = "document"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": document_type,
        }

        payload["document"] = { link: link, caption: caption }
        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(recipient: ::String, longitude: ::Float, latitude: ::Float, name: ::String, address: ::String, reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_location(recipient:, longitude:, latitude:, name:, address:, reply_message_id: nil)
        location_type = "location"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": location_type,
        }

        payload["location"] = {
          "longitude": longitude,
          "latitude": latitude,
          "name": name,
          "address": address
        }
        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(recipient: ::String, contacts: ::T::Array[::CloudWaba::Models::Messages::Contact], reply_message_id: ::T.nilable(::String)).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_contact(recipient:, contacts:, reply_message_id: nil)
        contacts_type = "contacts"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": contacts_type,
        }

        payload["contacts"] = contacts.map(&:serialize)
        payload["context"] = { "message_id": reply_message_id } unless reply_message_id.nil?

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      # curl -X  POST \
      #   'https://graph.facebook.com/v18.0/FROM_PHONE_NUMBER_ID/messages' \
      #   -H 'Authorization: Bearer ACCESS_TOKEN' \
      #   -H 'Content-Type: application/json' \
      #   -d '{
      #     "messaging_product": "whatsapp",
      #     "recipient_type": "individual",
      #     "to": "PHONE_NUMBER",
      #     "type": "reaction",
      #     "reaction": {
      #       "message_id": "wamid.HBgLM...",
      #       "emoji": "\uD83D\uDE00"
      #     }
      #   }'
      sig do
        params(recipient: ::String, emoji: ::String, reply_message_id: ::String).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_reaction(recipient:, emoji:, reply_message_id: nil)
        reaction_type = "reaction"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": reaction_type,
        }

        payload["reaction"] = {
          "message_id": reply_message_id,
          "emoji": emoji
        }

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end


      sig do
        params(
          recipient: ::String,
          template_name: ::String,
          template_lang: ::String,
          components: ::T::Array[::CloudWaba::Models::Templates::Component]
        ).returns(::CloudWaba::Models::Messages::Response)
      end
      def send_template(recipient:, template_name:, template_lang:, components:)
        template_type = "template"

        payload = {
          "messaging_product": MESSAGING_PRODUCT,
          "recipient_type": RECIPIENT_TYPE,
          "to": recipient,
          "type": template_type,
          "template": {
            "name": template_name,
            "language": {
              "code": template_lang
            },
            "components": []
          }
        }

        response = with_error_handling { http_client.post(body: payload, headers: {}) }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Messages::Response.parse(hash: parsed_response)
      end

      sig do
        params(media_id: ::String).returns(::CloudWaba::Models::Media::Response)
      end
      def fetch_media_url(media_id:)
        url = "#{@config.base_url}/#{@config.api_version}/#{media_id}"
        client = ::CloudWaba::HttpClient.new(base_url: url, auth_token: @config.access_token)
        response = with_error_handling { client.get }
        parsed_response = JSON.parse(response.body.to_s)
        ::CloudWaba::Models::Media::Response.parse(hash: parsed_response)
      end

      sig do
        params(media_url: ::String).returns(::File)
      end
      def download_media(media_url:)
        client = ::CloudWaba::HttpClient.new(base_url: media_url, auth_token: @config.access_token)
        response = client.get
        build_file(response: response)
      end

      private

      def http_client
        ::CloudWaba::HttpClient.new(base_url: messages_endpoint, auth_token: @config.access_token)
      end

      def messages_endpoint
        "#{@config.base_url}/#{@config.api_version}/#{@config.phone_number_id}/messages"
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

      sig { params(response: ::HTTP::Response).returns(::File) }
      def build_file(response:)
        file_content = response.body
        content_disposition = response['Content-Disposition']

        if content_disposition && content_disposition =~ /filename=(["'])?([^'"\s]+)/
          filename = $2
        else
          # If Content-Disposition is not present or doesn't contain filename information,
          # infer the extension from Content-Type
          content_type = response['Content-Type']
          filename += case content_type
                      when 'text/plain'
                        'txt'
                      when 'application/pdf'
                        'pdf'
                      when 'image/jpeg'
                        'jpg'
                      when 'image/png'
                        'png'
                      when 'image/webp'
                        'webp'
                      when 'audio/aac'
                        'aac'
                      when 'audio/mp4'
                        'mp4'
                      when 'audio/mpeg'
                        'mp3'
                      when 'audio/amr'
                        'amr'
                      when 'audio/ogg'
                        'ogg'
                      when 'video/mp4'
                        'mp4'
                      when 'video/3gp'
                        '3pg'
                      end
        end

        file_path = "/tmp/#{filename || 'file.' + file_extension}"
        File.open(file_path, 'wb') do |f|
          f.write(file_content.to_s)
        end

        File.new(file_path)
      end
    end
  end
end