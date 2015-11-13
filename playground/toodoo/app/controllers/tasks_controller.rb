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
    if params[:task_complete].blank?
      @task.complete = false
    else
      @task.complete = params[:task_complete]
    end
    if @task.save
      redirect_to "/tasks"
    else
      # redirect_to "/tasks"
      @tasks = Task.all
      render :index
    end
  end

end
