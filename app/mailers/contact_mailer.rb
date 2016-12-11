class ContactMailer < ApplicationMailer
  default from: 'contact-form@hilltop-kennels.com'

  def contact_form(name, email, phone, question)
    @name = name
    @email = email
    @phone = phone
    @question = question

    to_emails = "jkent2910@gmail.com, DAVID@HILLTOPKENNELSIOWA.COM"
    mail(:to => to_emails,
         :subject => "New Contact Form Submitted")

  end
end
