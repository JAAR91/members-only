class ComentController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.create(comment_params)
    redirect_to user_post_path(current_user.id, post.id)
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :body,:post_id)
    end
end
