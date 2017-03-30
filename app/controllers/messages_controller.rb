class MessagesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js
  def create
    message = current_user.messages.build(message_params)
    if message.save
      redirect_to messages_index_path
    else
      redirect_to root_path
    end
  end

  def index
    @message = current_user.messages.build
    @messages = Message.all
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
