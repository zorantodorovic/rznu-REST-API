class ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: projects
  end

  def show
  	project = Project.find(params[:id])
  	puts project
  	render json: project
  end
end