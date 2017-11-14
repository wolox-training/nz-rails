module Api
  module V1
    class UsersController < AuthenticationController
      def create
        @user = User.new(user_params)
        if @user.save
          render :json => @user
        else
          render :json => { :errors => @user.errors.full_messages }
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
