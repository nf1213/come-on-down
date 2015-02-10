class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize!
    if current_user.nil? or !current_user.admin
      redirect_to prizes_path, notice: "You are not authorized to view this resource."
    end
  end
end
