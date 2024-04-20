class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  
  def index
  end  
  
  def new
    @post = Post.new
    4.times {@post.post_options.build}
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
  end  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :category_id, post_options_attributes: [:id, :content]).merge(user_id: current_user.id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end  
  
  def set_categories
    @categories = Category.all
  end  
end
