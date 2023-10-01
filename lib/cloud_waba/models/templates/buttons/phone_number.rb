# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      module Buttons
        class PhoneNumber < T::Struct
          prop :type, ::CloudWaba::Models::Enums::Templates::ButtonType, default: ::CloudWaba::Models::Enums::Templates::ButtonType::PhoneNumber
          prop :text, ::String
          prop :phone_number, ::String
        end
      end
    end
  end
end