# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class FooterComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Footer
        prop :text, ::String

        def serialize
          {
            type: type.serialize,
            text: text
          }
        end
      end
    end
  end
end