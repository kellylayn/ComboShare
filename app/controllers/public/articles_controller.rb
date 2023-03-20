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


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
