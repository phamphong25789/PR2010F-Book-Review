class BooksController < ApplicationController
	before_action :find_book, only: [:show]

	def show
	end

	def index
    @categories = Category.all
		@books = Book.all
    if(params[:category].present?)
    	@category = Category.find_by id: params[:category]
	    @books = @category.nil? ? [] : @category.books
    end
	end

	private
	def find_book
		@book = Book.find_by id: params[:id]
		unless @book.present?
			flash[:success] = "Book doesn't exist"
			redirect_to root_path
		end
	end

end
