class TasksController < ApplicationController
  # validate user
  #before_action :authenticate_user!
  #before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    #@tasks = Task.all
    tasks = Task.order("created_at DESC")
    #render json: @tasks
    render json: tasks
  end

  # GET /tasks/1
  def show
    render json: task
  end

  # POST /tasks
  def create
    #@task = Task.new(task_params)
    task = Task.create(task_params)
    render json: task
  end

  # PATCH/PUT /tasks/1
  def update
    task = Task.find(params[:id])
    task.update(task_params)
    render json: task
    
    #if task.update(task_params)
    #   render json: @task
    #  render json: task
    #else
    #  render json: task.errors, status: :unprocessable_entity
    #end
  end

  # DELETE /tasks/1
  def destroy
    #@task.destroy
    task = Task.find(params[:id])
    task.destroy
    head :no_content, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_task
    #  @task = Task.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
