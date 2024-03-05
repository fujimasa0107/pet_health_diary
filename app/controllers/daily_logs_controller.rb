class DailyLogsController < ApplicationController

  def index

  end

  def new
    @daily_log = DailyLog.new
  end

  def create
    
    @daily_log = DailyLog.new(daily_log_params)
    if @daily_log.save
      redirect_to daily_logs_path, notice: '記録が作成されました。'
    else
      render :new
    end
  end

  private
  def daily_log_params
    params.require(:daily_log).permit(:pet_id, :date, :food_intake, :water_intake, :toilet_count, :exercise_time, :image).merge(user_id: current_user.id)
  end

end
