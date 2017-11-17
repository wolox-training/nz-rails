
class MailerWorker
  include Sidekiq::Worker
  def perform(user, book_id, from, to)
    email = User.find(user).email
    book = Book.find(book_id)
    UserMailer.rent_notification_email(email, book, from, to)
  end
end
