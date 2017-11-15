module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Authentication::Controller
      before_action :authenticate_request

      ENTITY_KEY = :email

      def entity_payload(entity)
        { ENTITY_KEY => entity.email }
      end

      def find_authenticable_entity(entity_payload_returned_object)
        User.find_by(id: entity_payload_returned_object.fetch(ENTITY_KEY))
      end
    end
  end
end
