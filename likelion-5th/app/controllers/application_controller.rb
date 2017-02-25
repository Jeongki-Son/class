class ApplicationController < ActionController::Base
  before_action :authenticate_user!
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
end