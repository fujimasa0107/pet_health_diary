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
    if user_signed_in?
      Check.find_or_create_by(user_id: current_user.id, article_id: @article.id)
    end
  end

  def edit
  end
  
  def update
    if @article.update(article_params)
      return redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = current_user.article.find(params[:id])

    if @article.destroy
      return redirect_to root_path
    else
      render 'show'
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

