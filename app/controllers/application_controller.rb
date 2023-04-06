class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_based_on_controller, except: [:top, :about]


  def after_sign_in_path_for(resource)
    articles_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  private
  def authenticate_based_on_controller
    current_admin ? authenticate_admin! : authenticate_end_user!
  end
    # 上記の分解
    # if current_admin
    #   authenticate_admin!
    # else
    #   authenticate_user!
    # end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end