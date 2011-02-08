class ProjectsController < ApplicationController
	def index
		@projects = current_user.projects.all
	end
	
	def new
		@project = Project.new
	end
	
	def create
		@project  = current_user.projects.build(params[:project])
		
		if @project.save
    	flash[:success] = "Project created!"
    	redirect_to projects_path
 	 	else
    	render 'pages/home'
  	end
	end
	
	def destroy
		@project = Project.find(params[:id])
		if @project.destroy
			flash[:success] = "Project deleted!"
			redirect_to projects_path
		end
	end
end
