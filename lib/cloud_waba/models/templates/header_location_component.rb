# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class HeaderLocationComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Header

        def serialize
          {
            type: type.serialize,
            format: "LOCATION"
          }
        end
      end
    end
  end
end