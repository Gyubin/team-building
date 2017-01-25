class ProjectController < ApplicationController
  def list
    @projects = Project.all
  end
  def heart_list
    p_id_list = Heart.select("project_id").where(:user_id => session["user_username"])
    @projects = Project.where(:id => p_id_list)
  end
  
  def detail
    @project = Project.find(params[:id])
    @project.online += 1
    @project.save
    @comments = Comment.where(:project_id =>params[:id] )
    
  end
  
  def upload
      
  end

  def upload_process
    project = Project.new
    project.title = params[:title]
    project.picture = params[:picture]
    project.content = params[:content]
    project.online = 0
    project.writer = session["user_username"]
    
    project.save
    redirect_to '/project/list'
  end
  
  def modify
    @project = Project.find(params[:id])
  end
  def modify_process
    project = Project.find(params[:id])
    
    project.title = params[:title]
    project.content = params[:content]
    project.picture = params[:picture]

    project.save
    
    redirect_to "/project/detail/#{ params[:id] }"
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to '/project/list'
  end
  
  def comment_upload
    comment = Comment.new
    comment.writer = session["user_username"]
    comment.content = params[:content]
    comment.project_id = params[:project_id]
    comment.save
    
    redirect_to "/project/detail/#{ params[:project_id] }"
  end
  
  def comment_destroy
    comment = Comment.find(params[:id])
    project_id = comment.project_id
    comment.destroy
    
    redirect_to "/project/detail/#{ project_id }"
  end
end


