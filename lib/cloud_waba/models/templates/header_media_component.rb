# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class HeaderMediaComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Header
        prop :format, ::CloudWaba::Models::Enums::Templates::Format
        prop :example, ::CloudWaba::Models::Templates::Example

        def serialize
          {
            type: type.serialize,
            format: format.serialize,
            example: { header_handle: [ example.values ] }
          }
        end
      end
    end
  end
end