# typed: true
# frozen_string_literal: true
module CloudWaba
  module Models
    module Enums
      module Templates
        class ComponentType < T::Enum
          enums do
            Headers = new("headers")
            Body = new("body")
            Footer = new("footer")
            Buttons = new("buttons")
          end
        end
      end
    end
  end
end
