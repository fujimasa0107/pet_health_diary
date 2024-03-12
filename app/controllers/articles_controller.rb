class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @ranking_articles = Article.where('created_at >= ?', 1.month.ago)
                               .order(views_count: :desc)
                               .limit(10) # トップ10の記事
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
    @article = Article.find(params[:id])
    @article.increment!(:views_count)
  end

  private
  def article_params
    params.require(:article).permit(:category_id, :title, :content, :image)
  end
end

