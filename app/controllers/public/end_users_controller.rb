class Public::EndUsersController < ApplicationController
  before_action :is_matching_login_end_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @end_user = EndUser.find(params[:id])
    @articles = @end_user.articles
    @articles = @end_user.articles.order(created_at: :desc)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user.id)
    else
      render :edit
    end
  end


  private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction)
  end

  def is_matching_login_end_user
    end_user = EndUser.find(params[:id])
    unless end_user.id == current_end_user.id
      redirect_to articles_path, notice: '自分以外のプロフィール編集画面へは遷移できません'
    end
  end

  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name == "guestuser"
      redirect_to end_user_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
