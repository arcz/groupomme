class Groups::JoinController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    begin
      @group.users << current_user
    rescue ActiveRecord::RecordInvalid
      redirect_to :back, alert: 'You are already member of this group'
    else
      redirect_to :back, notice: 'You are now member of this group'
    end
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    @group.users.delete(current_user)
    redirect_to :back, notice: 'You are no longer member of this group'
  end
end
