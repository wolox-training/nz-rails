module Api
  module V1
    class AuthenticationController < ApiController
      include Wor::Authentication::SessionsController
      skip_before_action :authenticate_request, only: [:create]
      after_action :authenticate_request, :current_user

      def authenticate_entity(params)
        entity = User.find_by(email: params[:email])
        return nil unless entity.present? && entity.valid_password?(params[:password])
        entity
      end
    end
  end
end
