module Api
  module V1
    class BooksController < ApiController
      skip_before_action :authenticate_request, only: [:isbn]

      include Wor::Paginate
      def index
        render_paginated Book.where(book_params)
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end

      def isbn
        open = OpenLibraryService.new
        render json: open.book_info(params[:isbn])
      end

      private def book_params
        params.permit(:author,
                      :title,
                      :genre,
                      :year,
                      :image,
                      :author)
      end

    end
  end
end
