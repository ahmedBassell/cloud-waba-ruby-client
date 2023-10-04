# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class List < T::Struct
        extend ::T::Sig
        extend ::T::Helpers
        
        prop :templates, ::T::Array[::CloudWaba::Models::Templates::Response]
        prop :paging, ::T::Hash[::T.untyped, ::T.untyped]
      end
    end
  end
end
