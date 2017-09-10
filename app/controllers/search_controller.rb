class SearchController < ApplicationController
    def search
        if params[:search].blank?
            @search_term = ""
            @articles = Article.none
        else
            @search_term = params[:search]

            @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
        end
        @latest_articles = Article.all.where(featured: 0).order('created_at desc').limit(5)
		@featured_articles = Article.where.not(featured: 0)
    end
end
