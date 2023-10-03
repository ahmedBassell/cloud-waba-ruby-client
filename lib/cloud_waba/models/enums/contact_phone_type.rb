# typed: true
# frozen_string_literal: true
module CloudWaba
  module Models
    module Enums
      class ContactPhoneType < T::Enum
        enums do
          Main = new("MAIN")
          Cell = new("CELL")
          Iphone = new("IPHONE")
          Home = new("HOME")
          Work = new("WORK")
        end
      end
    end
  end
end
