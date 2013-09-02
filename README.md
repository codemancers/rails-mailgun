# MailgunRails
Mailgun integration for rails

[![Build Status](https://travis-ci.org/code-mancers/mailgun-rails.png?branch=master)](https://travis-ci.org/code-mancers/mailgun-rails)

## Installation
Add this line to your application's Gemfile:

    gem 'mailgun', git: "git://github.com/code-mancers/mailgun-rails.git"

And then execute:

    $ bundle install

## Usage
Mailgun needs 2 config variables.

1. `api_host` : the domain which you have used for registration
2. `api_key`  : the api key for access. it starts with `key-`

Add these lines to your `environment/production.rb` file

```ruby
Your::Application.configure do
  # ....

  # mailgun deilvery method
  config.action_mailer.delivery_method  = :mailgun
  config.action_mailer.mailgun_settings = {
    api_host: "samples.mailgun.org",
    api_key:  "key-3ax6xnjp29jd6fds4gc373sgvjxteol0"
  }
end
```

## Running the specs
Specs can be run via:

    bundle exec rspec spec/*_spec.rb

## TODO
1. Add error handling once the response is received from mailgun
2. Write a helper rake task to quickly check whether integration is working or not!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
