class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    
  end

  def new
    @category = Category.new
  end

  def edit
    
  end

  def create
    @category = Category.new category_params
    if @category.save!
      flash[:success]="Category created!"
      redirect_to admin_category_path(@category)
    else
      flash[:danger]="Creating category fail!"
      redirect_to new_category_path
    end
  end

  def update
    if @category.update category_params
      flash[:success] = "Category updated"
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to 
  end

  private
    def find_category
      @category =  Category.find_by id: params[:id]
      unless @category.present?
        flash[:danger] = "Category doesn't exist"
        redirect_to admin_categories_path
      end
    end

    def category_params
      params.require(:category).permit :name
    end

    def admin_user
      redirect_to root_url unless current_user.role_admin?
    end
end
