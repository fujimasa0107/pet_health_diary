class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    # 月間ランキング用の記事
    @ranking_articles = Article.where('created_at >= ?', 1.month.ago)
                               .order(views_count: :desc)
                               .limit(10)
  
    # カテゴリIDがパラメータとして存在する場合、そのカテゴリに属する記事を取得
    if params[:category_id].present?
      @articles = Article.where(category_id: params[:category_id])
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: '記事が作成されました。'
    else
      render :new
    end
  end

  def show
    @article.increment!(:views_count)
  end

  def edit
    @article.user == current_user
  end
  
  def update
    if @article.update(article_params)
      return redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.destroy
      redirect_to articles_path, notice: '記事が削除されました。'
    else
      redirect_to articles_path, alert: '他のユーザーの記事は削除できません。'
    end
  end

  private
  def article_params
    params.require(:article).permit(
      :category_id,
      :title,
      :content,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

