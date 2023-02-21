module ApplicationCable
  class ChatChannel < ActionCable::Channel::Base

    def subscribed
      stream_from "chat_#{params[:room]}"
    end


    def receive(data)
      ActionCable.server.broadcast("chat_#{params[:room]}", data)
    end
  end
end
