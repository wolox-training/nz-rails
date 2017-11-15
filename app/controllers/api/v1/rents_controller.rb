module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate
      skip_before_action :authenticate_request, only: [:create]

      def index
        render_paginated Rent.where(user: params[:user_id])
      end

      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          render json: @rent
        else
          render json: { errors: @rent.errors.full_messages },status: 400
        end
      end

      private def rent_params
        params.required(:rent).permit(:user_id,:book_id,:from,:to)
      end
    end
  end
end
