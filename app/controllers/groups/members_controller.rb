class Groups::MembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])
    @group.users << @user
  end

  def destroy
    @group = Group.find(params[:group_id])
    @user = User.find(params[:id])
    @group.user.delete(@user)
  end
end
