class TasksController < ApplicationController
	
	def show
		@task = Task.find(params[:id])
	end
	
	def new
		@project = Project.find(params[:project_id])
		@task = @project.tasks.build
	end
	
	def create
		@project = Project.find(params[:project_id])
		@task  = @project.tasks.build(params[:task])
		
		if @task.save
			flash[:success] = "Task saved"
			redirect_to task_path(@task)
		else
			render 'task/new'
		end
	end
end
