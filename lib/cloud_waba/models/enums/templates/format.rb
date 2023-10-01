# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Enums
      module Templates
        class Format < T::Enum
          enums do
            Image = new("IMAGE")
            Video = new("VIDEO")
            Document = new("DOCUMENT")
          end
        end
      end
    end
  end
end

