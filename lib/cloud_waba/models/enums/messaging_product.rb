# typed: true
# frozen_string_literal: true
module CloudWaba
  module Models
    module Enums
      class MessagingProduct < T::Enum
        enums do
          WhatsApp = new("whatsapp")
        end
      end
    end
  end
end
