require "rails-mailgun/engine"
require "rails-mailgun/mail"
require "rest-client"

module RailsMailgun
end

ActionMailer::Base.add_delivery_method :mailgun, RailsMailgun::Mail
