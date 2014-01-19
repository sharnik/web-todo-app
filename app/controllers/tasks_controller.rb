class TasksController < ApplicationController
  respond_to :json

  def index
    @tasks = Task.order('id asc')
  end

  def create
    @task = Task.create!(task_params)

    render action: :show
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
