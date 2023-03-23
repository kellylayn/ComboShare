class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    @articles = @end_user.articles
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def index
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to end_user_path(end_user.id)
  end


  private

  def end_user_params
    params.require(:end_user).permit(:name)
  end
end
