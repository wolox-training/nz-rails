module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      def index
        render_paginated Book.where(book_params)
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
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
