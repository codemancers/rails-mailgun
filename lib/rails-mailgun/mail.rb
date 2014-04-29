module RailsMailgun
  class Mail
    def initialize(settings)
      @settings = settings
    end
    attr_accessor :settings

    def deliver!(mail)
      client = Mailgun::Client.new(settings[:api_key])
      client.send_message(settings[:api_host], message_object(mail))
    end

    private

    def message_object(mail)
      message_object = Mailgun::MessageBuilder.new

      message_object.set_from_address( mail.from.join(' ') )
      mail.to.each { |t| message_object.add_recipient(:to, t) }

      message_object.set_subject(mail.subject)

      if mail.content_type.match(/html/)
        message_object.set_html_body(mail.body.to_s)
      else
        message_object.set_text_body(mail.body.to_s)
      end

      message_object
    end
  end
end
