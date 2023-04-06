class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = Article.all.order(created_at: :desc)
    @end_user = current_end_user
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @end_user = current_end_user
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:notice] = "投稿記事は削除されました"
    redirect_to admin_articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
