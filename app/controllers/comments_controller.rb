class CommentsController < ApplicationController
  before_action :require_user

 def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.build(params.require(:comment).permit(:body))
  @comment.user = User.find(session[:user_id])

  if @comment.save
    flash[:notice] = "Comment has been created."
    redirect_to post_path(@post)
  else
    render 'posts/show'
  end
 end

 def vote
  comment = Comment.find(params[:id])
  Vote.create(user_id: current_user.id, voteable: comment, vote: params[:vote])
  redirect_to :back
 end
end