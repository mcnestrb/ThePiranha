class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def search
      @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end

  protected
  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end
end
