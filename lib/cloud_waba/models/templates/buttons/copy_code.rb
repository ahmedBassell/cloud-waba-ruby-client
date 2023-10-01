# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      module Buttons
        class CopyCode < T::Struct
          prop :type, ::CloudWaba::Models::Enums::Templates::ButtonType, default: ::CloudWaba::Models::Enums::Templates::ButtonType::CopyCode
          prop :example, ::String
        end
      end
    end
  end
end