class CommentsController < ApplicationController
  
  def new
      @comment = Comment.new(parent_id: params[:parent_id])
    end

    def create
        @comment = Comment.new(comment_params)
      end
      
      if @comment.save!
        flash[:success] = 'Your comment was successfully added!'
        redirect_to @comment.review
      else
       render 'new'
      end
    end


    def index
      @comments = Comment.hash_tree
  end
  
    private

    def comment_params
      params.require(:comment).permit(:parent_id, :content, :user_id, :review_id)
    end
end