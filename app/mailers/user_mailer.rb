class UserMailer < ApplicationMailer
  def new_rent_notification(rent_id)
    rent = Rent.find(rent_id)
    @book = rent.book
    @from = rent.from
    @to = rent.to
    mail(to: rent.user.email, subject: I18n.t(:rent_creation_subject)) do |format|
      format.html { render 'rent_finished_notification' }
    end
  end
end
