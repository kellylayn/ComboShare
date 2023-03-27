class Public::ArticleCommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article_comment = current_end_user.article_comments.new(article_comment_params)
    @article_comment.article_id = @article.id
    if @article_comment.save
      redirect_to article_path(@article)
    elsif
      # @article = Article.find(params[:article_id])
      @end_user = current_end_user
      # article = Article.find(params[:article_id])
      render 'public/articles/show'
    end
    #↑エラーメッセージ出すためにrenderしたいけど上手くいかない
  end

  def destroy
    ArticleComment.find(params[:id]).destroy
    redirect_to article_path(params[:article_id])
  end


  private

  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
end
