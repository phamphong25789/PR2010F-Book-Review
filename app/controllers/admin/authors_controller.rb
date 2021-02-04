class Admin::AuthorsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user
  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
    
  end

  def new
    @author = Author.new
  end

  def edit
    
  end

  def create
    @author = Author.new author_params
    if @author.save!
      flash[:success]="author created!"
      redirect_to admin_author_path(@author)
    else
      flash[:danger]="Creating author fail!"
      redirect_to new_author_path
    end
  end

  def update
    if @author.update author_params
      flash[:success] = "Author updated"
      redirect_to admin_author_path(@author)
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author deleted"
    redirect_to 
  end

  private
    def find_author
      @author =  Author.find_by id: params[:id]
      unless @author.present?
        flash[:danger] = "Author doesn't exist"
        redirect_to admin_authors_path
      end
    end

    def author_params
      params.require(:author).permit :name, :description
    end

    def admin_user
      redirect_to root_url unless current_user.role_admin?
    end
end
