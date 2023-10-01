# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class HeaderComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Headers
      end
    end
  end
end