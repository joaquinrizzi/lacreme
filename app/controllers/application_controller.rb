class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      root_path
    else
      root_path
    end
  end
end
