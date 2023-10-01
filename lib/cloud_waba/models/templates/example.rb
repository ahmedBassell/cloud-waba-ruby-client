# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class Example < T::Struct
        prop :values, ::T::Array[::String]
      end
    end
  end
end