# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Enums
      module Templates
        class Category < T::Enum
          enums do
            Authentication = new("AUTHENTICATION")
            Marketing = new("MARKETING")
            Utility = new("UTILITY")
          end
        end
      end
    end
  end
end

