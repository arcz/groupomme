class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(params.require(:comment).permit(:body).merge(user_id: current_user.id))
    redirect_to :back, notice: 'Comment has been created'
  end
end
