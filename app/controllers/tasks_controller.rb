class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # 全タスク
    @tasks = current_user.tasks
  end

  def do_tasks
    # やるタスク一覧
    @tasks = current_user.tasks.where(will_do: true)
  end

  def not_do_tasks
    # やらないタスク一覧
    @tasks = current_user.tasks.where(will_do: false)
  end

  def continuous_tasks
    # 継続タスク一覧（マイページで表示）
    @tasks = current_user.tasks.where(is_continuous: true)
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

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :will_do, :is_continuous)
  end
end