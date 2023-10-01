# typed: true
# frozen_string_literal: true
module CloudWaba
  module Models
    module Enums
      module Templates
        class ComponentType < T::Enum
          enums do
            Header = new("HEADER")
            Body = new("BODY")
            Footer = new("FOOTER")
            Buttons = new("BUTTONS")
            Carousel = new("CAROUSEL")
            LimitedTimeOffer = new("LIMITED_TIME_OFFER")
          end
        end
      end
    end
  end
end
