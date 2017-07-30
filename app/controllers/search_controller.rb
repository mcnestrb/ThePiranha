class SearchController < ApplicationController
    def search
        if params[:search].blank?
            @search_term = ""
            @articles = Article.none
        else
            @search_term = params[:search]

            @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
        end
    end
end
