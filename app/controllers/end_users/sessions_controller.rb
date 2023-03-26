class EndUsers::SessionsController < Devise::SessionsController
  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to articles_path, notice: 'guestuserでログインしました。'
  end
end