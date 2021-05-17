class PostController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    p @post
    p @post.save
    if @post.save
      flash.alert = "Post created succesfuly!"
      redirect_to root_path
    else
      flash.alert = "Error unable to save the post"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_post_path(@post.user_id,@post.id)
    else
      flash.alert = "Error!Unable to update the post"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comment.each do |comment|
      comment.destroy
    end
    @post.destroy

    redirect_to root_path
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
