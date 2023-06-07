class ChatsController < ApplicationController
  def create
    chat_service = ChatService.new
    @message = params[:message]
    response = chat_service.chat(@message)
    render plain: response
  end
end
