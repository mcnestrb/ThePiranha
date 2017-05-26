class ArticlesController < ApplicationController
	before_action :authenticate_admin!, except: [:show, :index]
	before_action :is_verified_admin?, except: [:show, :index]
	impressionist :actions=>[:show]

	def index
		@articles = Article.all.where(featured: 0).order('created_at desc').limit(13)
		@featured_1 = Article.where(featured: 1).take
		@featured_2 = Article.where(featured: 2).take
		@featured_3 = Article.where(featured: 3).take
	end

	def show
    	@article = Article.find(params['id'])
		@article_views = @article.impressionist_count(:filter=>:session_hash)
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
		if params[:commit] == 'Publish'
			@article = Article.find(params[:id])

			if @article.update(article_params)
				redirect_to @article
			else
				render 'edit'
			end
		elsif params[:commit] == 'Delete Photo'
			@article = Article.find(params[:id])
			@article.photo.destroy
			@article.save

			redirect_to edit_article_path
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	def feature
		@old_feature = Article.where(featured: params["/articles/#{params[:id]}"][:feature]).take
		unless !@old_feature
			@old_feature.featured = 0
			@old_feature.save
		end

		@article = Article.find(params[:id])
		@article.featured = params["/articles/#{params[:id]}"][:feature]
		@article.save

		redirect_to root_path
	end

	

	private
		def article_params
			params.require(:article).permit(:title, :content, :photo, :author_name)
		end
end
