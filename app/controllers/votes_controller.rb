class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    if @post.user == current_user
      redirect_to root_path, alert: "自分の記事には投票できません"
    elsif already_voted?(params[:post_id], params[:session_id]) 
      redirect_to root_path, alert: "すでに投票しています"
    else  
      @vote = Vote.new(vote_params)
      if @vote.save
        redirect_to root_path, notice: "投票完了しました"
      else
        redirect_to root_path, alert: "投票に失敗しました"
      end
    end
  end
  
  private
  
  def vote_params
    params.permit(:post_id, :post_option_id, :session_id)
  end
  
  def already_voted?(post_id, session_id)
    Vote.exists?(post_id: post_id, session_id: session_id)
  end  
end