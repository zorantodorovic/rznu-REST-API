class ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: posts
  end
end