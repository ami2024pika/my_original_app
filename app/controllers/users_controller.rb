class UsersController < ApplicationController
  def show
    @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(5)
  end  
end
