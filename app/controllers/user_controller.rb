class UserController < ApplicationController
  include ApplicationHelper
  
  def join
  end
  
  def join_process
    user = User.new
    user.username = params[:username]
    user.password = params[:password]
    user.university = params[:university]
    user.major = params[:major]
    user.isMale = params[:sex]
    user.introduction = params[:introduction]
    user.email = params[:email]
    user.save
    
    redirect_to '/project/list'
  end
  
  def login_process
    u = User.where(:username => params[:username], :password => params[:password]).take
            
    unless u.nil?
    #로그인을 수행
      session["user_username"] = u.id
    end
    
    redirect_to '/project/list'
  end
  
  def logout
    reset_session
    redirect_to '/project/list'
  end
  
  def update
    @user = User.find(session["user_username"])
  end
  
  def update_process
    user = User.where(:username => params[:username]).take
    
    user.password = params[:password]
    user.university = params[:university]
    user.major = params[:major]
    user.isMale = params[:sex]
    user.introduction = params[:introduction]
    user.email = params[:email]
    user.save
    
    session["user_username"] = user.id
    redirect_to '/project/list'
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def heart_share
    heart = Heart.new 
    heart.user_id = session["user_username"]
    heart.project_id = params["id"]
    heart.save
    
    redirect_to '/project/list'
  end
  
  def heart_destroy
    heart = Heart.where(:project_id => params["id"], :user_id => session["user_username"]).take
    heart.destroy
    
    redirect_to '/project/list'
  end
end