class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = Group.all

  end

  def create
    @group = Group.new(group_params)
    if @group.save
      Membership.create(group_id: @group.id, user_id: current_user.id)
      flash[:notice] = ["Group successfully created"]
      redirect_to "/groups"
    else
      flash[:notice] = @group.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @group = Group.find(params[:id])
    @memberships = Membership.where(group_id: @group.id)
  end

  def destroy
    @user = current_user
    @group = Group.find(params[:id])
    if @group.user.id == @user.id
      @group.destroy
      redirect_to "/groups"
    else
      flash[:notice] = @group.errors.full_messages
      redirect_to :back
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :description).merge(user: current_user)
  end
end
