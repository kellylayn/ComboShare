class Public::SearchesController < ApplicationController
  # before_action :authenticate_end_user!, except: [:show, :index]

  def search
    @end_user = current_end_user
    @range = params[:range]
    @end_users,@articles = [],[]
    if @range == "ユーザー"
      @end_users = EndUser.looks(params[:search], params[:word])
      render "/public/searches/search_result"
    else
      @articles = Article.looks(params[:search], params[:word])
      render "/public/searches/search_result"
    end
  end
end
