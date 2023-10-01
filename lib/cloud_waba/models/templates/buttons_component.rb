# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class ButtonsComponent < T::Struct
        prop :type, ::CloudWaba::Models::Enums::Templates::ComponentType, default: ::CloudWaba::Models::Enums::Templates::ComponentType::Buttons
        prop :buttons, ::T::Array[::CloudWaba::Models::Templates::Button]
      end
    end
  end
end