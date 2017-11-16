class UserMailer < ApplicationMailer
  def rent_finished_notification(rent_id)
    rent = Rent.find(rent_id)
    @book = rent.book
    @from = rent.from
    @to = rent.to
    mail(to: rent.user.email, subject: "Rent information") do |format|
      format.html {render 'rent_finished_notification'}
    end
  end
end
