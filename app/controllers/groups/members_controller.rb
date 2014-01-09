class Groups::MembersController < ApplicationController
  before_filter :set_group
  
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: @group.users
      end
    end
  end

  def create
    begin
      @user = User.find(params[:user][:user_id])
      @group.users << @user
    rescue ActiveRecord::RecordNotFound
      redirect_to :back, alert: 'User was not found'
    rescue ActiveRecord::RecordInvalid
      redirect_to :back, alert: 'User is already member of group'
    else
      redirect_to :back, notice: 'User has been added to group'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @group.user.delete(@user)
    redirect_to :back
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
