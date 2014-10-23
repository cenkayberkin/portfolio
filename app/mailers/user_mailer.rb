class UserMailer < ActionMailer::Base
  default from: "cenkayberkin@gmail.com"

  def welcome_message(contact)
    @greeting = "Hi #{contact.name}"
    mail to: contact.email , subject: contact.message
  end
end
