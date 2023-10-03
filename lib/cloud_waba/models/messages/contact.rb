# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Messages
      class Contact < T::Struct
        extend ::T::Sig
        extend ::T::Helpers

        # {
        #   "addresses": [{
        #       "street": "STREET",
        #       "city": "CITY",
        #       "state": "STATE",
        #       "zip": "ZIP",
        #       "country": "COUNTRY",
        #       "country_code": "COUNTRY_CODE",
        #       "type": "HOME"
        #     },
        #     {
        #       "street": "STREET",
        #       "city": "CITY",
        #       "state": "STATE",
        #       "zip": "ZIP",
        #       "country": "COUNTRY",
        #       "country_code": "COUNTRY_CODE",
        #       "type": "WORK"
        #     }],
        #   "birthday": "YEAR_MONTH_DAY",
        #   "emails": [{
        #       "email": "EMAIL",
        #       "type": "WORK"
        #     },
        #     {
        #       "email": "EMAIL",
        #       "type": "HOME"
        #     }],
        #   "name": {
        #     "formatted_name": "NAME",
        #     "first_name": "FIRST_NAME",
        #     "last_name": "LAST_NAME",
        #     "middle_name": "MIDDLE_NAME",
        #     "suffix": "SUFFIX",
        #     "prefix": "PREFIX"
        #   },
        #   "org": {
        #     "company": "COMPANY",
        #     "department": "DEPARTMENT",
        #     "title": "TITLE"
        #   },
        #   "phones": [{
        #       "phone": "PHONE_NUMBER",
        #       "type": "HOME"
        #     },
        #     {
        #       "phone": "PHONE_NUMBER",
        #       "type": "WORK",
        #       "wa_id": "PHONE_OR_WA_ID"
        #     }],
        #   "urls": [{
        #       "url": "URL",
        #       "type": "WORK"
        #     },
        #     {
        #       "url": "URL",
        #       "type": "HOME"
        #     }]
        # }

        prop :name, ::CloudWaba::Models::Messages::ContactName
        prop :phones, ::T.nilable(::T::Array[::CloudWaba::Models::Messages::ContactPhone])
      end
    end
  end
end