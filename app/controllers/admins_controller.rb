class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def home
	end

    def manage
		@verified_editors = Editor.where(verified: true)
		@unverified_editors = Editor.where(verified: false)
    end

	def destroy
	    @editor = Editor.find(params[:id])
	    @editor.destroy

	    if @editor.destroy
	        redirect_to admin_path, notice: "Editor deleted."
	    end
  	end

	def verify
		@editor = Editor.find(params[:id])
		@editor.verified = true

		@editor.save

		redirect_to admin_manage_path
	end
end
