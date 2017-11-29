class OpenLibraryController < ApplicationController
  def index; end

  def create
    open = OpenLibraryService.new
    @response = open.book_info(params[:isbn])
    byebug
    if @response.nil?
      render json:'', status: :not_found
    else
      render json: @response, status: :ok
    end
  end
end
