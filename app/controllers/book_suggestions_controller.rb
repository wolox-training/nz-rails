
class BookSuggestionsController < Api::V1::BookSuggestionsController
  include Wor::Paginate
  skip_before_action :authenticate_request, only: %i[new show]
  protect_from_forgery with: :exception

  def new
    @book_suggestion = BookSuggestion.new
    @all_book_suggestion = BookSuggestion.all
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
