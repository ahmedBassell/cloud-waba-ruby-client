class Utils
  extend ::T::Sig
  extend ::T::Helpers

  sig { returns(Models::Config) }
  def self.import_config
    Dotenv.load
    validate_config!

    base_url = ENV.fetch("WA_BASE_URL", "https://graph.facebook.com")
    app_id = ENV.fetch("M4D_APP_ID", "")
    app_secret = ENV.fetch("M4D_APP_SECRET", "")
    phone_number_id = ENV.fetch("WA_PHONE_NUMBER_ID", "")
    business_account_id = ENV.fetch("WA_BUSINESS_ACCOUNT_ID", "")
    access_token = ENV.fetch("CLOUD_API_ACCESS_TOKEN", "")
    api_version = ENV.fetch("CLOUD_API_VERSION", "v16.0")

    config = Models::Config.new(
      base_url: base_url,
      app_id: app_id,
      app_secret: app_secret,
      phone_number_id: phone_number_id,
      business_account_id: business_account_id,
      api_version: api_version,
      access_token: access_token,
    )

    config
  end

  private

  sig { void }
  def self.validate_config!
    # TODO: Validate configuration
  end
end