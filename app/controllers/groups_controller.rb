class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(groups_params)
    redirect_to controller: :top, action: :index
  end

  private
  def groups_params
    params.require(:group).permit(:group_name)
  end

end
