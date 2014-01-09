class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.moderators << current_user
      redirect_to @group, notice: 'Your group has been created'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id]).decorate
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
