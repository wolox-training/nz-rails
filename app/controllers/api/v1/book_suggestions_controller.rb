module Api
  module V1
    class BookSuggestionsController < ApiController
      include Wor::Paginate

      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_param
          .merge(user_id: current_entity.id))
        if @book_suggestion.save
          render json: @book_suggestion, status: :ok
        else
          render json: { errors: @book_suggestion.errors.full_messages }, status: 201
        end
      end

      private def book_suggestion_param
        params.require(:book_suggestion).permit(
          :author,
          :title,
          :link,
          :year,
          :publisher,
          :editorial,
          :price
        )
      end
    end
  end
end
