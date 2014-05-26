class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  # def index
  #   @tasks = Task.all
  # end

  def index
    @task = Task.new
    # @tasks = Task.all
    @tasks = current_user.tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path, notice: 'Successfully created task.'
    else
      render 'index'
    end
  end

  def show
  end

  def destroy
    @task.delete
    redirect_to tasks_path, notice: 'Successfully deleted.'
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description).merge(user: current_user)
  end
end