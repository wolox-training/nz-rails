module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_request, only: [:create]

      def create
        @book_suggestion = Bookuggestion.new(book_suggestion_param,
          user:current_user,
          year:params[:year],
          editorial:params[:editorial],
          publisher:params[:publisher],
          price:params[:price])
          if @book_suggestion.
            render json: '', status: :ok
          else
            render json: { errors: @book_suggestion.errors.full_messages }, status: 201
          end
      end

      private def book_suggestion_param
        params.require(:book_suggestion).permit(:author,:title,:link)
      end
    end
  end
end
