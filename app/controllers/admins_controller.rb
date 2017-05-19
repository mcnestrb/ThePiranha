class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def home
	end

    def manage
      @admins = Admin.all
    end

	def destroy
	    @admin = Admin.find(params[:id])
	    @admin.destroy

	    if @admin.destroy
	        redirect_to admin_path, notice: "Admin deleted."
	    end
  	end
end
