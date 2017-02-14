class MessagesController < ApplicationController
before_action :all_groups
before_action :selected_group

  def index
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to controller: :messages, action: :index
    else
      redirect_to controller: :messages, action: :index
      flash[:notice] = "メッセージ送信が失敗しました！"
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
   params.require(:message).permit(:body).merge(user_id:current_user.id,group_id: params[:group_id] )
  end

end
