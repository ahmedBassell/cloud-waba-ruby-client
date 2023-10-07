# typed: true
# frozen_string_literal: true

module CloudWaba
  class Utils
    extend ::T::Sig
    extend ::T::Helpers

    sig do
      params(
        app_id: ::T.nilable(::String),
        app_secret: ::T.nilable(::String),
        phone_number_id: ::T.nilable(::String),
        business_account_id: ::T.nilable(::String),
        access_token: ::T.nilable(::String),
        api_version: ::T.nilable(::String)
      ).returns(::CloudWaba::Models::Config)
    end
    def self.import_config(app_id:, app_secret:, phone_number_id:, business_account_id:, access_token:, api_version:)
      Dotenv.load

      base_url = ENV.fetch("WA_BASE_URL", "https://graph.facebook.com")
      app_id = app_id || ENV.fetch("M4D_APP_ID", "")
      app_secret = app_secret || ENV.fetch("M4D_APP_SECRET", "")
      phone_number_id = phone_number_id || ENV.fetch("WA_PHONE_NUMBER_ID", "")
      business_account_id = business_account_id || ENV.fetch("WA_BUSINESS_ACCOUNT_ID", "")
      access_token = access_token || ENV.fetch("CLOUD_API_ACCESS_TOKEN", "")
      api_version = api_version || ENV.fetch("CLOUD_API_VERSION", "v16.0")

      validate_config!(
        app_id: app_id,
        app_secret: app_secret,
        phone_number_id: phone_number_id,
        business_account_id: business_account_id,
        access_token: access_token
      )

      ::CloudWaba::Models::Config.new(
        base_url: base_url,
        app_id: app_id,
        app_secret: app_secret,
        phone_number_id: phone_number_id,
        business_account_id: business_account_id,
        api_version: api_version,
        access_token: access_token
      )
    end

    private

    sig { params(
      app_id: ::T.nilable(::String),
      app_secret: ::T.nilable(::String),
      phone_number_id: ::T.nilable(::String),
      business_account_id: ::T.nilable(::String),
      access_token: ::T.nilable(::String)).void }
    def self.validate_config!(app_id:, app_secret:, phone_number_id:, business_account_id:, access_token:)
      error_message = nil

      if app_id.nil? || app_id.empty?
        error_message = "app_id parameter is missing"
      elsif app_secret.nil? || app_secret.empty?
        error_message = "app_secret parameter is missing"
      elsif phone_number_id.nil? || phone_number_id.empty?
        error_message = "phone_number_id parameter is missing"
      elsif business_account_id.nil? || business_account_id.empty?
        error_message = "business_account_id parameter is missing"
      elsif access_token.nil? || access_token.empty?
        error_message = "access_token parameter is missing"
      end

      raise ::CloudWaba::Errors::MissingParameter, error_message unless error_message.nil?
    end
  end
end
