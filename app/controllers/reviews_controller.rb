class ReviewsController < ApplicationController
	include SessionsHelper

	before_action :find_review, only: [:show, :edit, :update, :destroy]
	before_action :find_book, only: [:new]

	def show
	end

	def new
		@review = Review.new
	end

	def create
		@review = current_user.reviews.new(review_params)
		if @review.save!
			flash[:success]="Product created!"
			redirect_to review_path(@review)
		else
			flash[:danger]="Creating production fail!"
			redirect_to new_review_path
		end
	end

	private
	def review_params
		params.require(:review).permit(:user_id, :book_id, :content, :image)
	end

	def find_review
		@review =  Review.find_by id: params[:id]
		unless @review.present?
			flash[:success] = "Review doesn't exist"
			redirect_to review_url
		end
	end

	def find_book
		@book = Book.find_by id: params[:book_id]
		unless @book.present?
			flash[:success] = "Book dosen't exist"
			redirect_to root_path
		end
	end

	

end