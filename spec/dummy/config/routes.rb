Rails.application.routes.draw do

  mount MailgunRails::Engine => "/mailgun-rails"
end
