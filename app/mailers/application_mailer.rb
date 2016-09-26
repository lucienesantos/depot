class ApplicationMailer < ActionMailer::Base
  include SendGrid
  
  default from: "thiennemonteiro@gmail.com"

  layout 'mailer'
end
