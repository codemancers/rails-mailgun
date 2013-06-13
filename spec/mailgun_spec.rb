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
  let(:url)  { "https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0@api.mailgun.net/v2/samples.mailgun.org/messages" }

  context "when mail is plain text" do
    let(:message_params) do
      {
        from:    "from@example.com",
        to:      "to@example.com",
        subject: "Test Mail",
        text:    "Plain Text Mail"
      }
    end

    it "sends a test mail" do
      RestClient.should_receive(:post).once.with(url, message_params)
      MailgunTestMailer.text_mail.deliver
    end
  end

  context "when mail is html" do
    let(:message_params) do
      {
        from:    "from@example.com",
        to:      "to@example.com",
        subject: "Test Mail",
        html:    "<h1>Html Mail</h1>"
      }
    end

    it "sends a html mail" do
      RestClient.should_receive(:post).once.with(url, message_params)
      MailgunTestMailer.html_mail.deliver
    end
  end
end
