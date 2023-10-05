Gem::Specification.new do |s|
  s.name        = "cloud-waba-ruby-client"
  s.version     = "0.0.2"
  s.summary     = "Cloud Waba Client for Ruby."
  s.description = "A simple API wrapper for Cloud Whatsapp Business API"
  s.authors     = ["Ahmed Bassell"]
  s.email       = "ahmedbassell@gmail.com"
  # s.platform    = Gem::Platform::RUBY
  s.files       = `git ls-files`.split("\n")
  s.homepage    =
    "https://rubygems.org/gems/cloud_waba"
  s.license       = "MIT"
  
  # Runtime dependencies
  s.add_dependency 'dotenv', '~>2.8.0' # env variable
  s.add_dependency 'http', '~> 4.4.1'

  # Development dependencies
  s.add_development_dependency "rspec", '~>3.4.0' # testing
  s.add_development_dependency 'webmock', '~>3.17.0'
  s.add_development_dependency 'sorbet', '~> 0.5.1'
  s.add_runtime_dependency 'sorbet-runtime', '~>0.5.1'
end
