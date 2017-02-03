class ArticlesController < ApplicationController
	before_action :authenticate_admin!, except: [:show, :index]

	def index
		@articles = Article.all
	end

	def show
    @article = Article.find(params['id'])
	end

	def new
		@article = Article.new
	end

	def create
		if params[:commit] == 'Publish'
			@article = Article.new(article_params)

			if @article.save
			  redirect_to @article
			else
				render 'new'
			end
		elsif params[:commit] == 'Save Draft'
			@draft = Draft.new(article_params)

			if @draft.save
			  redirect_to edit_draft_path(@draft)
			else
				render 'new'
			end
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :content, :photo)
		end
end
