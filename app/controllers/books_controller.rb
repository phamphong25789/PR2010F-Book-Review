class BooksController < ApplicationController
	def show
		@book = Book.find_by id: params[:id]
		unless @book.present?
			flash[:success] = "Book doesn't exist"
			redirect_to root_url
		end
	end
end