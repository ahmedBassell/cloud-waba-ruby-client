# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      module Buttons
        class Url < T::Struct
          prop :type, ::CloudWaba::Models::Enums::Templates::ButtonType, default: ::CloudWaba::Models::Enums::Templates::ButtonType::Url
          prop :text, ::String
          prop :url, ::String
          prop :example, ::T.nilable(::T::Array[::String])
        end
      end
    end
  end
end