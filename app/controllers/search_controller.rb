class SearchController < ApplicationController
    def search
        if(params[:search])
            @search_term = params[:search]
            @articles = Article.search(params[:search])
        else
            @search_term = ""
            @articles = Article.none
        end
    end
end
