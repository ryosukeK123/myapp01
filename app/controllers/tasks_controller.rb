class TasksController < ApplicationController

  def index
    @do_tasks = current_user.tasks.where(task_type: :do)
    @not_do_tasks = current_user.tasks.where(task_type: :not_do)
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを追加しました"
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :task_type)
  end
end