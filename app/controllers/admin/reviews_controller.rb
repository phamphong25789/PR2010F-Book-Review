class Admin::ReviewsController < ApplicationController
  def index
    if params[:term]
      @reviews = Review.search(params[:term])
    else
      @reviews = Review.all
    end
  end

  private

    def review_params
      params.require(:review).permit(:term)
    end
end
