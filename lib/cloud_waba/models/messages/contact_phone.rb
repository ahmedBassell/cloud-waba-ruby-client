# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Messages
      class ContactPhone < T::Struct
        extend ::T::Sig
        extend ::T::Helpers

        #     {
        #       "phone": "PHONE_NUMBER",
        #       "type": "HOME"
        #     }
        #
        #     {
        #       "phone": "PHONE_NUMBER",
        #       "type": "WORK",
        #       "wa_id": "PHONE_OR_WA_ID"
        #     }

        prop :phone, ::String
        prop :type, ::CloudWaba::Models::Enums::ContactPhoneType
        prop :wa_id, ::T.nilable(::String)
      end
    end
  end
end