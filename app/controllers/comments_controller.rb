class CommentsController < ApplicationController
  
  def new
      @comment = Comment.new(parent_id: params[:parent_id])
    end

    def create
      if params[:comment][:parent_id].to_i > 0
        parent = Comment.find_by_id(params[:comment].delete(:parent_id))
        @comment = parent.children.build(comment_params)
      else
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