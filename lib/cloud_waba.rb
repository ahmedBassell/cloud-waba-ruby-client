class CloudWaba
  extend ::T::Sig
  extend ::T::Helpers

  attr_reader :messages
  attr_reader :config

  def initialize
    @config = Utils.import_config
  end

  def messages
    API::Messages::Service(config: @config)
  end
end