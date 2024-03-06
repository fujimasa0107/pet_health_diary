class DailyLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @daily_logs = current_user.daily_logs
  end

  def new
    @daily_log = DailyLog.new
  end

  def create

    @daily_log = DailyLog.new(daily_log_params)
    if @daily_log.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    @daily_log = current_user.daily_logs.find(params[:id])
    @month_daily_logs = current_user.daily_logs.where(date: @daily_log.date.beginning_of_month..@daily_log.date.end_of_month)
    @daily_totals = @month_daily_logs.group_by(&:date).transform_values { |logs| calculate_totals(logs) }
  end
  

  private
  def daily_log_params
    params.require(:daily_log).permit(:pet_id, :date, :food_intake, :water_intake, :toilet_count, :exercise_time, :image).merge(user_id: current_user.id)
  end

  def calculate_totals(logs)
    logs.each_with_object(Hash.new(0)) do |log, totals|
      totals[:food_intake] += log.food_intake
      totals[:water_intake] += log.water_intake
      totals[:toilet_count] += log.toilet_count
      totals[:exercise_time] += log.exercise_time
    end
  end
end
