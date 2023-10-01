# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      module Buttons
        class Otp < T::Struct
          prop :type, ::CloudWaba::Models::Enums::Templates::ButtonType, default: ::CloudWaba::Models::Enums::Templates::ButtonType::Otp
          prop :otp_type, ::String
          prop :text, ::String
          prop :autofill_text, ::String
          prop :package_name, ::String
          prop :signature_hash, ::String
        end
      end
    end
  end
end