class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.order(created_at: :desc).page(params[:page]).per(5)
  end  
end
