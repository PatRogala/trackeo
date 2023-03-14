class TasksController < ApplicationController
  include DateHelper

  def index
    @date = parse_date_or_get_today(params[:date])

    @tasks = Task.for_date(@date)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Task added to your list!"
      redirect_to tasks_path(date: @task.deadline)
    else
      render :new
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.toggle!

    redirect_to tasks_path(date: @task.deadline)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
