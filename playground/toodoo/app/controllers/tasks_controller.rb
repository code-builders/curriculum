class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def get_it_done
    # add stuff to db
    @task          = Task.new
    @task.name     = params[:task_name]
    @task.complete = params[:task_complete]
    @task.save
    redirect_to "/tasks"
  end

end
