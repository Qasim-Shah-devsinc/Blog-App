class SendMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mail_mailer.send.subject
  #
  def send_mail
    @greeting = "Hi"

    mail to: "rais.taimoor@devsinc.com", subject: "Mail sent from company gmail"
  end
end
