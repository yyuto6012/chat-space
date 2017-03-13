class MessagesController < ApplicationController
before_action :all_groups, only: [:index]
before_action :selected_group, only: [:index]

  def index
    @messages = @group.messages
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end

  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
        if @message.save
            format.html { redirect_to :group_messages }
            format.json
        else
            format.html { redirect_to :group_messages, flash: "メッセージ送信が失敗しました！" }
        end
    end
  end

private

  def all_groups
     @groups = Group.order("created_at DESC")
  end

  def selected_group
     @group = Group.find(params[:group_id])
  end

  def message_params
   params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
