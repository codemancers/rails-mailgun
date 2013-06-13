class DummyMailer < ActionMailer::Base
  default from: "from@example.com"

  def text_mail
    mail to: "text@example.com", subject: "Test Text Mail"
  end

  def html_mail
    mail to: "html@example.com", subject: "Test Html Mail"
  end
end
