class RatesController < ApplicationController
  before_action :logged_in_user , only: [:create, :update, :destroy]
  before_action :find_rate, only: [:update, :destroy]
  before_action :find_book, only: [:create, :update, :destroy]

  def create
    params[:rate][:user_id] = current_user.id
    params[:rate][:book_id] = params[:book_id]
    if @book.present?
    @rate = @book.rates.build(rate_params)
      if @rate.save
        # flash success
        render json: @rate
      else
        flash[:danger] = "Rating fail"
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @rate.update rate_params
      flash[:success] = "Thanks for rating."
      render json: @rate
      # redirect_to admin_book_path(@rate)
    else
      flash[:danger] = "Rating fail"
    end
  end

  def destroy
    @rate.destroy
    flash[:success] = "Clear rating"
    redirect_to
  end

  private

    def find_rate
      @rate =  Rate.find_by id: params[:rate_id]
      unless @rate.present?
        flash[:danger] = "Rate doesn't exist"
      end
    end

    def find_book
      @book =  Book.find_by id: params[:book_id]
      unless @book.present?
        flash[:danger] = "Book doesn't exist"
        redirect_to admin_books_path
      end
    end

    def rate_params
      params.require(:rate).permit(:star, :user_id, :book_id)
    end
end
