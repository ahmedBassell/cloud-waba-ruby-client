# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class ButtonsComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Buttons
      end
    end
  end
end