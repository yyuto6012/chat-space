class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(groups_params)
  end

  private
  def groups_params
    params.require(:group).permit(:name)
  end
end
