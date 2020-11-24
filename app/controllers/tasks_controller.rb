class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @new = Task.new
    # once the method ends, it goes to the html counterpart
  end

  # no need for app/views/tasks/create.html.erb
  def create
    # is the name of the private method to allow the input from the form submitted
    @new = Task.new(task_params)
    @new.save

    # task_path is the route=> get 'task/:id', to: 'tasks#show', as: :task
    # passing it @new, rails will auto magically take the id and go to url
    # /task/@new.id
    redirect_to task_path(@new)
    # redirect user as there is no create.html to go
  end

  def edit
    # find the task to edit
    @task = Task.find(params[:id].to_i)
    # now go to edit.html to fetch GET the data from the server
  end

  def update
    # find the task to edit
    @task = Task.find(params[:id].to_i)
    # here i call the update method will save it and pass it the task_params
    # which is taken from the form submitted in edit.html
    @task.update(task_params)
    # redirect user as there is no update.html to go
    redirect_to task_path(@task)
    # task_path is the route=> get 'task/:id', to: 'tasks#show', as: :task
    # passing it @task, rails will auto magically take the id and go to url
    # /task/@task.id
  end

  def show
    @selected_task = Task.find(params[:id].to_i)
  end

  def destroy
    # find the task to delete
    @task_delete = Task.find(params[:id].to_i)
    # here i call the destroy method will delete and save the selected task
    @task_delete.destroy
    # send it to the main page with all
    redirect_to tasks_path
  end

  private

  # params[:task] give you the new instance
  def task_params
    # means, for the instance, allow it the following params
    params.require(:task).permit(:title, :details, :completed)
  end
end
