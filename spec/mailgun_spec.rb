require 'spec_helper'

# create a test mailer
class MailgunTestMailer < ActionMailer::Base
  default from: "from@example.com", to: "to@example.com", subject: "Test Mail"

  def text_mail
    mail do |format|
      format.text { render text: "Plain Text Mail" }
    end
  end

  def html_mail
    mail(content_type: "text/html") do |format|
      format.html { render text: "<h1>Html Mail</h1>" }
    end
  end
end


describe MailgunTestMailer do
  describe 'setting key and host for mailgun client' do
    it 'instantiates Mailgun::Client with api key' do
      Mailgun::Client.should_receive(:new) do |key|
        expect(key).to eq "key-3ax6xnjp29jd6fds4gc373sgvjxteol0"
        stub(send_message: true)
      end

      MailgunTestMailer.text_mail.deliver
    end

    it 'calls Mailgun::Client with send message by setting api host' do
      Mailgun::Client.any_instance.should_receive(:send_message) do |host, _|
        expect(host).to eq "samples.mailgun.org"
      end

      MailgunTestMailer.text_mail.deliver
    end
  end

  describe 'setting different parts of email' do
    before(:each) do
      Mailgun::Client.any_instance.should_receive(:send_message)
    end

    it 'sets subject from the mail passed' do
      Mailgun::MessageBuilder.any_instance.should_receive(:set_subject)
        .with('Test Mail')
      MailgunTestMailer.text_mail.deliver
    end

    it 'sets text body when the mail is in plain text' do
      Mailgun::MessageBuilder.any_instance.should_receive(:set_text_body)
        .with('Plain Text Mail')
      MailgunTestMailer.text_mail.deliver
    end

    it 'sets html body when the mail is in html' do
      Mailgun::MessageBuilder.any_instance.should_receive(:set_html_body)
        .with('<h1>Html Mail</h1>')
      MailgunTestMailer.html_mail.deliver
    end
  end
end
