# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/rent_finished_notification
  def rent_finished_notification
    UserMailerMailer.rent_finished_notification
  end

end
