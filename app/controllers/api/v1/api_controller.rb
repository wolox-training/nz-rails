module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Authentication::Controller
      include Pundit
      protect_from_forgery
      before_action :authenticate_request

      ENTITY_KEY = :email

      def entity_payload(entity)
        { ENTITY_KEY => entity.email }
      end

      def find_authenticable_entity(entity_payload_returned_object)
        User.find_by(email: entity_payload_returned_object.fetch(ENTITY_KEY))
      end

      def current_user
        current_entity
      end
    end
  end
end
