class PostsController < ApplicationController
  before_action :logged_in_user

  def new
    @user = User.find_by(slug: params[:user_slug])
    @post = Post.new
  end

  def show
    @user = User.find_by(slug: params[:user_slug])
    if Post.find_by(id: params[:id])
      @post = Post.find(params[:id])
    else
      post_not_found
    end
  end

  def create
    @user = User.find_by(slug: params[:user_slug])
    @post = @user.posts.create(post_params)
    redirect_to user_posts_path(@user)
  end

  def index
    @user = User.find_by(slug: params[:user_slug])
    @posts = Post.all
  end

  def edit
    @user = User.find_by(slug: params[:user_slug])
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find_by(slug: params[:user_slug])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(slug: params[:user_slug])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
