class Public::ArticleCommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article_comment = current_end_user.article_comments.new(article_comment_params)
    @article_comment.article_id = @article.id
    @article_comment.score = Language.get_data(article_comment_params[:comment])
    if @article_comment.save
      redirect_to article_path(@article)
    else
      @end_user = current_end_user
      render 'public/articles/show'
    end
  end

  def destroy
    ArticleComment.find(params[:id]).destroy
    if current_end_user
      redirect_to article_path(params[:article_id])
    else
      redirect_to admin_article_path(params[:article_id])
    end
  end


  private

  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
end
