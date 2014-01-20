class TasksController < ApplicationController
  respond_to :json

  def index
    @tasks = all_tasks
  end

  def create
    Task.create!(task_params)
    @tasks = all_tasks

    render action: :index
  end

  def open
    Task.find(params[:id]).open
    @tasks = all_tasks

    render action: :index
  end

  def complete
    Task.find(params[:id]).complete
    @tasks = all_tasks

    render action: :index
  end

  private

  def task_params
    params.require(:task).permit(:content, :project_id)
  end

  def all_tasks
    Task.order('created_at asc').includes(:project)
  end
end
