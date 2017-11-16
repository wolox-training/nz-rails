class UserMailer < ApplicationMailer
  def rent_finished_notification(email,book,from,to)
    @book=book
    @from=from
    @to=to
    mail(to: 'nzacsscrewsky@gmail.com',from: Rails.application.secrets.user_name, subject: "Rent information") do |format|
     format.html { render "rent_finished_notification" }
    end
  end
end
