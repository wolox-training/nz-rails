
module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      def index
        render_paginated Rent.where(user: params[:user_id])
      end

      def create
        @rent = Rent.new(rent_params)
        established_locale(@rent.user_id)
        if @rent.save
          AsyncMailerWorker.perform_async(UserMailer.new.new_rent_notification(@rent.id).deliver)
          render json: @rent
        else
          render json: { errors: @rent.errors.full_messages }, status: 400
        end
      end

      def email_user(rent_params)
        mailer = UserMailer.new
        mailer.rent_finished_notification(rent_params[:user_id],
                                          rent_params[:book_id],
                                          rent_params[:rent_from],
                                          rent_params[:rent_to])
      end

      private def rent_params
        params.required(:rent).permit(:user_id, :book_id, :from, :to)
      end

      private def established_locale(id)
        I18n.locale = User.find(id).locale || I18n.default_locale
      end
    end
  end
end
