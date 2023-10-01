# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      Button = T.type_alias do
        T.any(
          ::CloudWaba::Models::Templates::Buttons::CopyCode,
          ::CloudWaba::Models::Templates::Buttons::Otp,
          ::CloudWaba::Models::Templates::Buttons::PhoneNumber,
          ::CloudWaba::Models::Templates::Buttons::QuickReply,
          ::CloudWaba::Models::Templates::Buttons::Url,
        )
      end
    end
  end
end
