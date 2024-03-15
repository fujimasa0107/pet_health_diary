class GalleryImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @gallery_images = current_user.gallery_images.includes(:daily_log)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
    redirect_to(root_path, alert: "アクセス権限がありません。") unless @user == current_user
  end
end


