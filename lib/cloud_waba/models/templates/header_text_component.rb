# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class HeaderTextComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Header
        prop :text, ::String
        prop :example, ::T.nilable(::CloudWaba::Models::Templates::Example)

        def serialize
          {
            type: type.serialize,
            format: "TEXT",
            text: text,
            example: { header_text: example.values }
          }
        end
      end
    end
  end
end