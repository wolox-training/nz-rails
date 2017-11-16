
module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      def index
        render_paginated Rent.where(user: params[:user_id])
      end

      def create
        @rent = Rent.new(rent_params)
        email_user rent_params
        if @rent.save
          render json: @rent
        else
          render json: { errors: @rent.errors.full_messages }, status: 400
        end
      end

      def email_user(rent_params)
        mailer = MailerWorker.new
        mailer.perform(rent_params[:user_id],rent_params[:book_id],rent_params[:rent_from],rent_params[:rent_to])
      end

      class MailerWorker
        include Sidekiq::Worker
        def perform(user,book_id,from,to)
          email = User.find(user).email
          book = Book.find(book_id)
          usermailer = UserMailer.new
          #usermailer.send_simple_message
          usermailer.rent_finished_notification(email,book,from,to).deliver
        end
      end


      private def rent_params
        params.required(:rent).permit(:user_id, :book_id, :from, :to)
      end
    end
  end
end
