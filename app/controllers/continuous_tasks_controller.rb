class ContinuousTasksController < ApplicationController
  def update
    task = current_user.tasks.find(params[:task_id])
    continuous_task = task.continuous_task

    if continuous_task.last_checked_at != Date.today
      continuous_task.increment!(:streak_count)
      continuous_task.update!(last_checked_at: Date.today)
    end

    redirect_to tasks_path, notice: "継続日数を更新しました"
  end
end
