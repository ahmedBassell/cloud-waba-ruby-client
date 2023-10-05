require 'spec_helper'

describe ::CloudWaba::Client do
  let(:env_access_token) { ENV["CLOUD_API_ACCESS_TOKEN"] }
  let(:env_api_version) { ENV["CLOUD_API_VERSION"] }
  let(:env_app_id) { ENV["M4D_APP_ID"] }
  let(:env_app_secret) { ENV["M4D_APP_SECRET"] }
  let(:env_base_url) { ENV["WA_BASE_URL"] }
  let(:env_business_account_id) { ENV["WA_BUSINESS_ACCOUNT_ID"] }
  let(:env_phone_number_id) { ENV["WA_PHONE_NUMBER_ID"] }

  let(:param_access_token) { "CLOUD_API_ACCESS_TOKEN_PARAM_VALUE" }
  let(:param_api_version) { "CLOUD_API_VERSION_PARAM_VALUE" }
  let(:param_app_id) { "M4D_APP_ID_PARAM_VALUE" }
  let(:param_app_secret) { "M4D_APP_SECRET_PARAM_VALUE" }
  let(:param_business_account_id) { "WA_BUSINESS_ACCOUNT_ID_PARAM_VALUE" }
  let(:param_phone_number_id) { "WA_PHONE_NUMBER_ID_PARAM_VALUE" }

  before do
    # Set env variables for testing
    ENV["CLOUD_API_ACCESS_TOKEN"] = "CLOUD_API_ACCESS_TOKEN_VALUE"
    ENV["CLOUD_API_VERSION"] = "CLOUD_API_VERSION_VALUE"
    ENV["M4D_APP_ID"] = "M4D_APP_ID_VALUE"
    ENV["M4D_APP_SECRET"] = "M4D_APP_SECRET_VALUE"
    ENV["WA_BASE_URL"] = "WA_BASE_URL_VALUE"
    ENV["WA_BUSINESS_ACCOUNT_ID"] = "WA_BUSINESS_ACCOUNT_ID_VALUE"
    ENV["WA_PHONE_NUMBER_ID"] = "WA_PHONE_NUMBER_ID_VALUE"
  end

  context "When init new client instance using env variables" do
    it "Should read configuration from environment variables" do
      client = described_class.new

      expect(client.config.access_token).to eq(env_access_token)
      expect(client.config.api_version).to eq(env_api_version)
      expect(client.config.app_id).to eq(env_app_id)
      expect(client.config.app_secret).to eq(env_app_secret)
      expect(client.config.base_url).to eq(env_base_url)
      expect(client.config.business_account_id).to eq(env_business_account_id)
      expect(client.config.phone_number_id).to eq(env_phone_number_id)
    end
  end

  context "When init new client instance using params" do
    it "Should read configuration from parameters if provided" do
      client = described_class.new(
        app_id: param_app_id,
        app_secret: param_app_secret,
        phone_number_id: param_phone_number_id,
        business_account_id: param_business_account_id,
        access_token: param_access_token,
        api_version: param_api_version
      )

      expect(client.config.access_token).to eq(param_access_token)
      expect(client.config.access_token).not_to eq(env_access_token)

      expect(client.config.api_version).to eq(param_api_version)
      expect(client.config.api_version).not_to eq(env_api_version)

      expect(client.config.app_id).to eq(param_app_id)
      expect(client.config.app_id).not_to eq(env_app_id)

      expect(client.config.app_secret).to eq(param_app_secret)
      expect(client.config.app_secret).not_to eq(env_app_secret)

      expect(client.config.business_account_id).to eq(param_business_account_id)
      expect(client.config.business_account_id).not_to eq(env_business_account_id)

      expect(client.config.phone_number_id).to eq(param_phone_number_id)
      expect(client.config.phone_number_id).not_to eq(env_phone_number_id)
    end
  end

  context "When multiple clients co-exist" do
    it "Should have different configurations per client" do
      client_1 = described_class.new
      client_2 = described_class.new(
        app_id: param_app_id,
        app_secret: param_app_secret,
        phone_number_id: param_phone_number_id,
        business_account_id: param_business_account_id,
        access_token: param_access_token,
        api_version: param_api_version
      )

      expect(client_1).not_to eq(client_2)
      expect(client_1.config.access_token).not_to eq(client_2.config.access_token)
      expect(client_1.config.api_version).not_to eq(client_2.config.api_version)
      expect(client_1.config.app_id).not_to eq(client_2.config.app_id)
      expect(client_1.config.app_secret).not_to eq(client_2.config.app_secret)
      expect(client_1.config.business_account_id).not_to eq(client_2.config.business_account_id)
      expect(client_1.config.phone_number_id).not_to eq(client_2.config.phone_number_id)
    end
  end
end