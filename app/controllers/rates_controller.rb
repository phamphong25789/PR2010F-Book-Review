class RatesController < ApplicationController
  def create
   @book = Book.find_by id: params[:book_id]
   if @book.present?
    @rate = @book.rates.build(rate_params)
      if @rate.save
        # flash success
        render json: @rate
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:star, :user_id)
  end
end
