class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :new, :create, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_unless_creator!, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
  end
  
  def show
  end  
  
  def new
    @post = Post.new
    4.times {@post.post_options.build}
    # build_post_options(@post)
  end
  
  def create
    @post = Post.new(post_params)
    

    if @post.save
      redirect_to root_path, notice: "投稿完了しました"
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "投稿を更新しました"
    else
      render :edit
    end  
  end
  
  def destroy
    @post.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :category_id, post_options_attributes: [:content, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end  
  
  def set_categories
    @categories = Category.all
  end
  
  def redirect_unless_creator!
    redirect_to root_path unless @post.user == current_user
  end
  
  def build_post_options(post)
    (4 - post.post_options.size).times { post.post_options.build }
  end
end
