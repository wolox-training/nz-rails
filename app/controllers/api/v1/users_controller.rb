module Api
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate_request, only: [:create]

      def index
        render_paginate BookSuggestion
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
        else
          render json: { errors: @user.errors.full_messages }, status: 400
        end
      end

      private def user_params
        params.require(:user).permit(:first_name,
                                     :last_name,
                                     :email,
                                     :password,
                                     :password_confirmation,
                                     :locale)
      end
    end
  end
end
