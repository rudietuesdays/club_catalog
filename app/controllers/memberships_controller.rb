class MembershipsController < ApplicationController
  def create
    membership = Membership.new(user: current_user, group_id: params[:id])
    if Membership.exists?(user: current_user, group_id: params[:id])
      flash[:notice] = ["You are already a member of this group"]
      redirect_to :back
    else
      membership.save
      redirect_to :back
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @membership = Membership.find_by(group: @group, user: current_user)
    @membership.destroy if current_user === @membership.user
    redirect_to :back
  end
end
