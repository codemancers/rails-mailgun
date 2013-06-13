module MailgunRails
  class Mail
    def initialize(settings)
      @settings = settings
    end
    attr_accessor :settings

    def deliver!(mail)
      RestClient.post message_url, message_params(mail)
    end

    private
    def message_url
      "https://api.mailgun.net/v2/#{settings[:api_host]}/messages"
    end

    def message_params(mail)
      message_params = { from: mail.from, to: mail.to, subject: mail.subject }

      type = mail.content_type.match(/html/) ? :html : :text
      message_params[type] = mail.body.to_s

      message_params
    end
  end
end
