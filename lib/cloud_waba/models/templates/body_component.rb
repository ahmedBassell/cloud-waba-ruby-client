# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class BodyComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Body
        prop :text, ::String
        prop :example, ::T.nilable(::T::Hash[T.untyped, T.untyped])
      end
    end
  end
end
