class ProjectsController < ApplicationController
  respond_to :json

  def index
    @projects = Project.order('created_at asc')
  end

  def create
    Project.create!(project_params)
    @projects = Project.order('created_at asc')

    render action: :index
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
