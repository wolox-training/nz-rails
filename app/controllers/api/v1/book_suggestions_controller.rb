module Api
  module V1
    class BookSuggestionsController < ApiController
      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_param
          .merge(user_id: current_user_id))
        if @book_suggestion.save
          render json: @book_suggestion, status: :created
        else
          render json: { errors: @book_suggestion.errors.full_messages }, status: :bad_request
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

      private def current_user_id
        current_entity.id
      rescue Wor::Authentication::Exceptions::MissingAuthorizationHeader
        nil
      end
    end
  end
end
