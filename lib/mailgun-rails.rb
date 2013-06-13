require "mailgun-rails/engine"
require "mailgun-rails/mail"
require "rest-client"

module MailgunRails
end

ActionMailer::Base.add_delivery_method :mailgun, MailgunRails::Mail
