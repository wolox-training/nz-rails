
module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      def index
        @user = Rent.where(user: params[:user_id])
        authorize @user
        render_paginated Rent.where(user: params[:user_id])
      end

      def create
        @rent = Rent.new(rent_params)
        established_locale(@rent.user_id)
        authorize @rent.user_id
        if @rent.save
          send_mail(@rent)
        else
          render json: { errors: @rent.errors.full_messages }, status: 400
        end
      end


      private def rent_params
        params.required(:rent).permit(:user_id, :book_id, :from, :to)
      end

      def established_locale(id)
        I18n.locale = User.find(id).locale || I18n.default_locale
      end

      def send_mail(rent)
        AsyncMailerWorker.perform_async(UserMailer.new.new_rent_notification(rent.id).deliver)
        render json: rent
      end
    end
  end
end
