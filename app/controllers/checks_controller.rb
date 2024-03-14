class ChecksController < ApplicationController
  before_action :set_article, only: [:check, :revert_check]

  def check
    if user_signed_in?
      Check.find_or_create_by(user_id: current_user.id, article_id: @article.id)
    end
    redirect_to article_path(@article)
  end

  def revert_check
    if user_signed_in?
      check = Check.find_by(user_id: current_user.id, article_id: @article.id)
      check.destroy if check
    end
    head :no_content
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
