class DailyLogsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
  end

end
