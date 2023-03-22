class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    @articles = @end_user.articles
  end

  def edit
  end

  def index
  end
end
