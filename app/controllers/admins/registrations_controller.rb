class Admins::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  before_filter :authenticate_admin!
  before_filter :is_admin?, only: [:new, :create]

  def index
  end

  def new
  end

  def create

  end

  private
  def is_admin?
    if admin_signed_in?
      return false
    else
      return true
    end
  end
end
