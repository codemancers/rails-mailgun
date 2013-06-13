$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mailgun-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mailgun-rails"
  s.version     = MailgunRails::VERSION
  s.authors     = ["Yuva Kumar"]
  s.email       = ["yuva@codemancers.com", "hello@codemancers.com"]
  s.homepage    = "https://github.com/code-mancers/mailgun-rails"
  s.summary     = "Mailgun integration for rails"

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "rest-client", "~> 1.6.7"

  s.add_development_dependency "rspec-rails", "~> 2.13.2"
end
