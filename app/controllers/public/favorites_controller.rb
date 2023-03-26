class Public::FavoritesController < ApplicationController
  before_action :authenticate_end_user!, only: [:create, :destroy]
  before_action :article_params, only: [:create, :destroy]

  def index
    @favorites = current_end_user.favorites
  end

  def create
    # article = Article.find(params[:article_id])
    # favorite = current_end_user.favorites.new(article_id: @article.id)
    # favorite.save
    # redirect_to article_path(article)
    Favorite.create(end_user_id: current_end_user.id, article_id: @article.id)
  end

  def destroy
    # article = Article.find(params[:article_id])
    # favorite = current_end_user.favorites.find_by(article_id: article.id)
    favorite = Favorite.find_by(end_user_id: current_end_user.id, article_id: @article.id)
    favorite.destroy
    # redirect_to article_path(article)
  end


  private

  def article_params
    @article = Article.find(params[:article_id])
  end
end
