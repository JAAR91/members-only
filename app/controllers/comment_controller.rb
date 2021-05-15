class CommentController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comment.create(comment_params)
        flash.alert = "Comment added"
        redirect_to user_post_path(@post.user.id, @post.id)
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
    
        if @comment.update(comment_params)
          redirect_to user_post_path(@comment.user.id, @comment.post.id)
        else
          flash.alert = "Error!Unable to update the comment"
          render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    
        redirect_to user_post_path(@comment.user.id, @comment.post.id)
      end
    
    private
    def comment_params
        params.require(:comment).permit(:info, :post_id, :user_id)
    end
end
