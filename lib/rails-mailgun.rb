require "rails-mailgun/engine"
require "rails-mailgun/mail"
require 'mailgun'

module RailsMailgun
end

ActionMailer::Base.add_delivery_method :mailgun, RailsMailgun::Mail
