class ProjectsController < ApplicationController

	before_action :set_user
  before_action :validate_login

  def index
    projects = @user.projects
    render json: projects
  end

  def show
  	project = @user.projects.find(params[:id])
  	render json: project
  end

  def create
  	project = Project.new(project_params)
    if project.save
      render json: project, status: :created
    else
      render_error(project, :unprocessable_entity)
    end
  end

  def update
  	if @project.update_attributes(project_params)
      render json: @project, status: :ok
    else
      render_error(@project, :unprocessable_entity)
    end
  end

  def destroy
  	@project.destroy
    head 204
  end

  private

  def project_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  def set_user
    begin
      @user = User.find params[:user_id]
    rescue ActiveRecord::RecordNotFound
      user = User.new
      user.errors.add(:id, "Wrong ID provided")
      render_error(user, 404) and return
    end
  end

end