class GroupsController < ApplicationController
before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(groups_params)
    @group.users << current_user
    redirect_to controller: :top, action: :index
  end

  def edit
  end

  def update
    @group.update(groups_params)
    redirect_to controller: :top, action: :index
  end

  private
  def groups_params
    params.require(:group).permit(:group_name, {user_ids:[]})
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
