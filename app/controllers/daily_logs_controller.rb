class DailyLogsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      @daily_logs = current_user.daily_logs
    end
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
    @month_total = calculate_month_total(@daily_totals)
  end
  
  def edit
    @daily_log = current_user.daily_logs.find(params[:id])
  end

  def update
    @daily_log = current_user.daily_logs.find(params[:id])

    if @daily_log.update(daily_log_params)
      redirect_to daily_log_path
    else
      render :edit, status: :unprocessable_entity
    end
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

  def calculate_month_total(daily_totals)
    month_total = { food_intake: 0, water_intake: 0, toilet_count: 0, exercise_time: 0 }
    daily_totals.each_value do |day_totals|
      month_total[:food_intake] += day_totals[:food_intake]
      month_total[:water_intake] += day_totals[:water_intake]
      month_total[:toilet_count] += day_totals[:toilet_count]
      month_total[:exercise_time] += day_totals[:exercise_time]
    end
    month_total
  end
end
