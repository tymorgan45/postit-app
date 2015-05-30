require 'pry'

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :post, :vote]
  before_action :require_user, except: [:index, :show]
  before_action :require_creator, only: [:edit]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.find(session[:user_id])
    
    if @post.save
      flash[:notice] = "The post has been created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "This post was updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def vote
    Vote.create(user_id: current_user.id, voteable: @post, vote: params[:vote])
    redirect_to :back
  end

  def set_post
    @post = Post.find(params[:id])
  end

  
  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids:[])
  end

end


















