class CommentsController < ApplicationController
  before_action :find_review, only: [:new]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save!
      flash[:success] = "Comment created!"

      render json: {comment: @comment, user: @comment.user.name}, status: :ok
      # render json: @comment, status: :ok
    else
      render 'static_pages/home'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :targetable_type, :targetable_id)
  end

  def find_review
    @review =  Review.find_by id: params[:review_id]
    unless @review.present?
      flash[:success] = "Review doesn't exist"
      redirect_to review_url
    end
  end

  # def current_user
  #   redirect_to root_url unless @user.current_user? current_user
  # end

end