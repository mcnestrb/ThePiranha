class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_verified_editor?
      if current_editor['verified'] == true
          return true
      else
          redirect_to articles_path, :notice => "Not yet verified"
      end
  end

  def search
      @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end
  
  protected
  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end
end
