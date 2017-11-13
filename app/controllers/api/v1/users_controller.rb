module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: [:create]

      def create
        @user = User.create(user_params)
        render json: '', status: :ok
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
