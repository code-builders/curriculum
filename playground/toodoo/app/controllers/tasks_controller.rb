class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def get_it_done
    # add stuff to db
    # @task.name     = params[:task][:name]
    # if params[:task][:complete].blank?
    #   @task.complete = false
    # else
    #   @task.complete = params[:task][:complete]
    # end
    @task = Task.new(task_params)
    raise
    if @task.save
      redirect_to "/tasks"
    else
      # redirect_to "/tasks"
      @tasks = Task.all
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :complete)
  end

end
