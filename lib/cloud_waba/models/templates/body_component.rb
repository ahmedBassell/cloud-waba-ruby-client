# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class BodyComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Body
        prop :text, ::String
        prop :example, ::T.nilable(::CloudWaba::Models::Templates::Example)

        def serialize
          {
            type: type.serialize,
            text: text,
            example: { body_text: [ example.values ] }
          }
        end
      end
    end
  end
end
