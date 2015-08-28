module Api
  class FinishedBooksController < ApplicationController 
    respond_to :json
    def index
      books = Book.finished
      respond_with(books, status: 200)
    end
  end
end
