class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]
  before_action :find_favorite, only: [:destroy]

  def index
    @favorite = Favorite.all
  end

  def destroy
    @favorite.destroy
    flash[:success] = "Book deleted"
    redirect_to
  end

  private
    def find_favorite
      @favorite =  Favorite.find_by id: params[:id]
      unless @favorite.present?
        flash[:danger] = "Book doesn't exist"
        redirect_to favorite_index_path
      end
    end
end
