# typed: true
# frozen_string_literal: true
module CloudWaba
  module Models
    module Enums
      module Templates
        class ButtonType < T::Enum
          enums do
            CopyCode = new("COPY_CODE")
            Otp = new("OTP")
            PhoneNumber = new("PHONE_NUMBER")
            QuickReply = new("QUICK_REPLY")
            Url = new("URL")
          end
        end
      end
    end
  end
end
