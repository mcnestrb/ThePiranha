class DraftsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@drafts = Draft.all
	end

	def edit
		@draft = Draft.find(params[:id])
	end

	def update
		@draft = Draft.find(params[:id])

		if @draft.update(draft_params)
			redirect_to edit_draft_path(@draft)
		else
			render 'edit'
		end
	end

	def destroy
		@draft = Draft.find(params[:id])
		@draft.destroy

		redirect_to admin_path
	end

	private
		def draft_params
			params.require(:draft).permit(:title, :content, :photo)
		end
end
