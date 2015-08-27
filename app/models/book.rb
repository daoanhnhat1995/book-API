class Book < ActiveRecord::Base
   def index
     books = Book.all
     if rating = params[:rating]
       books = Book.where(rating: rating)
     end
     render json: books, status: 200
   end
end
