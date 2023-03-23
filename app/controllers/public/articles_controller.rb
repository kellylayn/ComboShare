class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.end_user_id = current_end_user.id
    @article.save
    redirect_to articles_path
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to article_path(article.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:notice] = "投稿記事は削除されました"
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
