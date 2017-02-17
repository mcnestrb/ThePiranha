class IssueLinksController < ApplicationController
    before_action :authenticate_admin!, except: [:show, :index]

    def index
        @issue_links = IssueLink.all
    end

    def show
        @issue_link = IssueLink.find(params[:id])
    end

    def new
        @issue_link = IssueLink.new
    end

    def create
        @issue_link = IssueLink.new(issue_link_params)
        unless @issue_link.issue_link[/\Ahttp:\/\//] || @issue_link.issue_link[/\Ahttps:\/\//]
            @issue_link.issue_link = "http://#{@issue_link.issue_link}"
        end

        if @issue_link.save
          redirect_to @issue_link
        else
            render 'new'
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
		def issue_link_params
			params.require(:issue_link).permit(:title, :issue_link)
		end

        def format_url(issue_link)

        end
end
