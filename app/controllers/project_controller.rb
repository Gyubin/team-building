class ProjectController < ApplicationController
  def list
    @projects = Project.all
  end
  def detail
    @project = Project.find(params[:id])
    @project.online += 1
    @project.save
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
  
  def update
    
  end
  
  def update_process
    @project = Project.find(params[:id])
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to '/project/list'
  end

end


