class DraftsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@drafts = Draft.all
	end

	def edit
		@draft = Draft.find(params[:id])
	end

	def update
		if params[:commit] == 'Update Draft'
			@draft = Draft.find(params[:id])

			if @draft.update(draft_params)
				redirect_to edit_draft_path(@draft)
			else
				render 'edit'
			end
		elsif params[:commit] == 'Publish'
			@draft = Draft.find(params[:id])
			@article = Article.new(draft_params)

			if @draft.photo.exists?
				@article.photo = @draft.photo
			end

			if @article.save
				@draft.destroy
			  redirect_to @article
			else
				render 'new'
			end
		elsif params[:commit] == 'Delete Photo'
			@draft = Draft.find(params[:id])
			@draft.photo.destroy
			@draft.save

			redirect_to edit_draft_path(@draft)
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
