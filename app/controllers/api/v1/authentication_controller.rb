module Api
  module V1
    class AuthenticationController < ApplicationController
      include Wor::Authentication::SessionsController
      skip_before_action :authenticate_request, only: [:create]



    def authenticate_entity(params)
      entity = User.find_by(email: params[:email])
      return nil unless entity.present? && entity.valid_password?(params[:password])
      entity
    end


    end #class
  end #module V1
end #module Api
