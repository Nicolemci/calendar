class CalendarController < ApplicationController
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    Day.ensure_days_for_month(@date)
    @beginning_of_month = @date.beginning_of_month.beginning_of_week(:sunday)
    @end_of_month = @date.end_of_month.end_of_week(:sunday)
    @days = (@beginning_of_month..@end_of_month).to_a
  end



  def show
    @day = Day.find(params[:id])
    @tasks = @day.tasks.order(:start_time)
  end
end
