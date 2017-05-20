class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_verified_admin?
      if current_admin.verified == true
          return true
      else
          redirect_to articles_path, :notice => "Not yet verified"
      end
  end
end
