class MessagesController < ApplicationController

  def index
    @groups = Group.order("created_at DESC")
    @group = Group.find(params[:group_id])
  end

end
