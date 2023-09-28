Gem::Specification.new do |s|
  s.name        = "cloud-waba-ruby-client"
  s.version     = "0.0.0"
  s.summary     = "Cloud Waba Client for Ruby."
  s.description = "A simple API wrapper for Cloud Whatsapp Business API"
  s.authors     = ["Ahmed Bassell"]
  s.email       = "ahmedbassell@gmail.com"
  # s.platform    = Gem::Platform::RUBY
  s.files       = ["lib/cloud_waba.rb"]
  s.homepage    =
    "https://rubygems.org/gems/cloud_waba"
  s.license       = "MIT"
  
  s.add_dependency 'dotenv' # env variable
  s.add_dependency 'http', '>= 4.0.0'
  s.add_development_dependency "rspec" # testing
  s.add_development_dependency 'webmock'
end
