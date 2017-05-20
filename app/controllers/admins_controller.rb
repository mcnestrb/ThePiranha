class AdminsController < ApplicationController
	before_action :authenticate_admin!
	before_filter :is_verified_admin?

	def home
	end

    def manage
      @verified_admins = Admin.where(verified: true)
	  @unverified_admins = Admin.where(verified: false)
    end

	def destroy
	    @admin = Admin.find(params[:id])
	    @admin.destroy

	    if @admin.destroy
	        redirect_to admin_path, notice: "Admin deleted."
	    end
  	end

	def verify
		@admin = Admin.find(params[:id])
		@admin.verified = true

		@admin.save
	end
end
