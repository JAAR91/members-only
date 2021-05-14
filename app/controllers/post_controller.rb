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
      redirect_to root_path
    else
      flash.alert = "Error unable to save the post"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
