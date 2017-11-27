class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer_user
  layout 'mailer'
end
