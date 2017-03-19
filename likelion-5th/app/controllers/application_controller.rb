class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user && (action_name == "new" || action_name == "create")
      "devise"
    else
      "application"
    end
  end

  def can_administer?
    current_user.roles.ids == [1]
  end
  
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
  end
  
  protected

   def configure_permitted_parameters
      # devise_parameter_sanitizer.for(:sign_up).push(:name, :surname,:username, :email, :avatar)
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :phone, :profile])
   end
end