class Admin::ReviewsController < ApplicationController
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

  private

    def review_params
      params.require(:review).permit(:term)
    end
end
