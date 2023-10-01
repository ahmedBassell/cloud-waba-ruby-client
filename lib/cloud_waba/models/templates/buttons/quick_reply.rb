# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      module Buttons
        class QuickReply < T::Struct
          prop :type, ::CloudWaba::Models::Enums::Templates::ButtonType, default: ::CloudWaba::Models::Enums::Templates::ButtonType::QuickReply
          prop :text, ::String
        end
      end
    end
  end
end