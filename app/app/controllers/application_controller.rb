class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_current_user
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :surname
     devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) << :username
  end
    
    
  helper_method :get_name, :get_config
   def get_name(user)
      if user.blank?
        return "InvalidUser"
      else
        if user.name.blank? and user.surname.blank? 
            return user.username.to_s
        else
            return user.name.to_s+" "+user.surname.to_s  
        end
      end
  end  
  def get_current_user
      @user=current_user
  end
  
  def get_config(name)
    return ConfigParams.find_by_name(name).value
  end
end
