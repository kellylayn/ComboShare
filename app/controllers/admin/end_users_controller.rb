class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def edit
    @end_user = EndUser.find(params[:id])
    @articles = @end_user.articles
    @articles = @end_user.articles.order(created_at: :desc)
  end

end
