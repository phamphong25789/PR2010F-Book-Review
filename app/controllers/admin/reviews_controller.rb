class Admin::ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
    if(params[:data].present?)
      @reviews = Review.search_word(params[:data]).take(5)
      render json: [@reviews.pluck(:content), @reviews.pluck(:id)]
    elsif params[:term]
      # @reviews = Review.search(params[:term])
      redirect_to root_path
    end
  end

  def show
  end

  private

    def review_params
      params.require(:review).permit(:term)
    end

    def find_review
    @review =  Review.find_by id: params[:id]
    unless @review.present?
      flash[:danger] = "Review doesn't exist"
      redirect_to admin_reviews_path
    end
  end
end
