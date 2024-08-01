class TasksController < ApplicationController
  def new
    @day = Day.find(params[:day_id])
    @task = @day.tasks.new
    @hour = params[:hour].to_i
  end

  def create
    @day = Day.find(params[:task][:day_id])
    @task = @day.tasks.new(task_params)
    if @task.save
      redirect_to calendar_path(@day)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time)
  end
end
