class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.new(group_params)
    if @post.save
      redirect_to :back
    end
  end
  
  private
  def group_params
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end
end
