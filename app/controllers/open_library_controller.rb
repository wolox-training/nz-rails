class OpenLibraryController < ApplicationController
  def index; end

  def create
    open = OpenLibraryService.new
    @response = open.book_info(params[:isbn])

    if @response.size == 1
      render status: :not_found
    else
      render json: @response, status: :ok
    end
  end
end
