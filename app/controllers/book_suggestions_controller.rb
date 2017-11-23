
class BookSuggestionsController < Api::V1::BookSuggestionsController
  include Wor::Paginate
  skip_before_action :authenticate_request, only: [:new]
  protect_from_forgery with: :exception

  def new
    @book_suggestion = BookSuggestion.new
  end
end
