class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @selectedTask = Task.find(params[:id].to_i)
  end
end
