# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    class Config < T::Struct
      prop :base_url, ::String
      prop :app_id, ::String
      prop :app_secret, ::String
      prop :phone_number_id, ::String
      prop :business_account_id, ::String
      prop :access_token, ::String
      prop :api_version, ::String
    end
  end
end