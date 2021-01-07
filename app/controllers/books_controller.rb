class BooksController < ApplicationController

	before_action :find_book, only: [:show]

	def show
	end

	private
	def find_book
		@book = Book.find_by id: params[:id]
		unless @book.present?
			flash[:success] = "Book dosen't exist"
			redirect_to root_path
		end
	end

end