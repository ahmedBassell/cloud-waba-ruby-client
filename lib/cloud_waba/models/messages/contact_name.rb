# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Messages
      class ContactName < T::Struct
        extend ::T::Sig
        extend ::T::Helpers

        #   "name": {
        #     "formatted_name": "NAME",
        #     "first_name": "FIRST_NAME",
        #     "last_name": "LAST_NAME",
        #     "middle_name": "MIDDLE_NAME",
        #     "suffix": "SUFFIX",
        #     "prefix": "PREFIX"
        #   }

        prop :formatted_name, ::String
        prop :first_name, ::T.nilable(::String)
        prop :last_name, ::T.nilable(::String)
        prop :middle_name, ::T.nilable(::String)
        prop :suffix, ::T.nilable(::String)
        prop :prefix, ::T.nilable(::String)
      end
    end
  end
end
