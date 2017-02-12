class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(groups_params)
    redirect_to controller: :top, action: :index
  end

  def edit
    @group = Group.find(params[:id])
  end


  def update
      group = Group.find(params[:id])
      group.update(groups_params)
      redirect_to controller: :top, action: :index
  end

  private
  def groups_params
    params.require(:group).permit(:group_name, {user_ids:[]})
  end

end
