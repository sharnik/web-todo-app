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

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)

    render action: :show
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!

    render json: {status: :ok}
  end

  private

  def task_params
    params.require(:task).permit(:content, :project_id)
  end

  def all_tasks
    Task.order('created_at asc').includes(:project)
  end
end
