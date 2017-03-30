class MessagesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_chat_channel',
                                    message: render_message(message)
                                   # content: message.content,
                                   # email: message.user.email
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

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
