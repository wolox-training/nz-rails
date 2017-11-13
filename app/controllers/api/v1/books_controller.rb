module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
#      before_validation 
      def index
         render_paginated Book
        ##@book = Book.all
        ##render json: @book
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end
    end
  end
end
