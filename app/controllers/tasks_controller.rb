class TasksController < ApplicationController
  respond_to :json

  def index
    @tasks = Task.order('created_at asc')
    @projects = Project.all
  end

  def create
    Task.create!(task_params)
    @tasks = Task.order('created_at asc')

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
end
