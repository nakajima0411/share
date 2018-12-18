class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    #@posts = Post.all
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #binding.pry
      if @post.save
        redirect_to post_path(@post),
        notice: 'Post was successfully created.'
      end
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post),
        notice: 'Post was successfully updated.'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    #binding.pry
    @post.destroy
      redirect_to posts_path,
      notice: 'Post was successfully destroyed.'
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :text, :genre)
    end
end
