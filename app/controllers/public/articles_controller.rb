class Public::ArticlesController < ApplicationController
  before_action :is_matching_login_end_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:new, :edit]

  def new
    @article = Article.new
    @end_user = current_end_user
  end

  def create
    @article = Article.new(article_params)
    @article.end_user_id = current_end_user.id
    if @article.save
      redirect_to articles_path
    else
      @end_user = current_end_user
      render :new
    end
  end

  def index
    @articles = Article.all
    @end_user = current_end_user
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @end_user = current_end_user
  end

  def edit
    @article = Article.find(params[:id])
    @end_user = current_end_user
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(article.id)
    else
      @end_user = current_end_user
      render :edit
    end
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

  def ensure_guest_user
    if current_end_user.name == "guestuser"
      redirect_to articles_path, notice: '新規投稿画面、投稿編集画面へ遷移できません。'
    end
  end

  def is_matching_login_end_user
    article = Article.find(params[:id])
    end_user = article.end_user
    unless end_user.id == current_end_user.id
      redirect_to articles_path, notice: '自分以外の投稿の編集画面へは遷移できません'
    end
  end
end
