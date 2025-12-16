class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @continuous_tasks = @user.tasks.where(is_continuous: true)
  end
end