class TasksController < ApplicationController


  def index
    @tasks = Task.all
    @motivations = Motivation.new.tweets
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
    # @task.user_id = @current_user.id
    raise
    if @task.save
      redirect_to "/tasks"
    else
      # redirect_to "/tasks"
      @tasks = Task.all
      render :index
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.complete = true
    @task.save
    redirect_to root_path
  end

  def get_it_gone
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :complete)
  end

end
