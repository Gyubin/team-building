class MessageController < ApplicationController
  def create
    message = Message.new
    
    message.send_id = session["user_username"]
    message.recv_id = params[:recv_id]
    message.content = params[:content]
    
    message.save
    
    redirect_to "/user/show/#{ params[:recv_id] }"
  end
  
  def reply
    message = Message.new
    
    message.send_id = session["user_username"]
    message.recv_id = params[:recv_id]
    message.content = params[:content]
    
    message.save
    
    redirect_to "/message/recv_list"
  end
  
  def recv_list
    @messages = Message.where(:recv_id => session["user_username"])
  end
  
  def send_list
    @messages = Message.where(:send_id => session["user_username"])
  end
  
  def destroy
    message = Message.find(params[:id])
    message.destroy
    
    redirect_to '/message/recv_list'
  end
end
