# typed: true
# frozen_string_literal: true

require 'http'

module Models
  module Messages
    class Response < T::Struct
      extend ::T::Sig
      extend ::T::Helpers
      ##
      # {
      #   "messaging_product"=>"whatsapp",
      #   "contacts"=>[
      #     {"input"=>"+201111111111", "wa_id"=>"202222222222"}
      #   ],
      #   "messages"=>[
      #     {"id"=>"wamid.HBgMMjUIzSNRIREAMOjAFQzxRjygADgAMAD1FQExzzIQMMjzM2UMxZ=="}
      #   ]
      # } 
      prop :messaging_product, ::Models::Enums::MessagingProduct
      prop :contacts, ::T::Array[::Models::Contact]
      prop :message_id, ::String

      sig { params(response: ::HTTP::Response).returns(::Models::Messages::Response) }
      def self.parse(response:)
        parsed_response = JSON.parse(response.body.to_s)
        contact_wa_id = parsed_response["contacts"][0]["wa_id"]
        message_id = parsed_response["messages"][0]["id"]

        self.new(
          messaging_product: ::Models::Enums::MessagingProduct::WhatsApp,
          contacts: [::Models::Contact.new(wa_id: contact_wa_id)],
          message_id: message_id
        )
      end
    end
  end
end