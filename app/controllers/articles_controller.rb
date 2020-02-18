class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :create, :new]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def show; end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
