class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def home
	end

    def manage
		@editors = Editor.all
    end

	def destroy
	    @editor = Editor.find(params[:id])
	    @editor.destroy

	    if @editor.destroy
	        redirect_to admin_manage_path, notice: "Editor deleted."
	    end
  	end
end
