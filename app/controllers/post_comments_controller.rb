class PostCommentsController < ApplicationController
  def create
    @comment = PostComment.new(post_comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'コメント投稿が完了しました'
    else
      redirect_to post_path(params[:post_id]), alert: "コメント投稿に失敗しました"
    end  
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
