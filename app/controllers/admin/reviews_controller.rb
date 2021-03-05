class Admin::ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :admin_user

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

  def new
    @review = Review.new
  end

  def edit
  end

  def update
    if @review.update review_params
      flash[:success] = "Review updated"
      redirect_to admin_review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end


  def find_review
    @review =  Review.find_by id: params[:id]
    unless @review.present?
      flash[:danger] = "Da xoa Review"
      redirect_to admin_reviews_path
    end
  end
  
  def admin_user
    redirect_to root_url unless current_user.role_admin?
  end
end
