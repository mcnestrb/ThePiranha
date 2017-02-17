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

        if @issue_link.save
          redirect_to @issue_link
        else
            render 'new'
        end
    end

    def edit
        @issue_link = IssueLink.find(params[:id])
    end

    def update
        @issue_link = IssueLink.find(params[:id])

        if @issue_link.update(issue_link_params)
            redirect_to @issue_link
        else
            render 'edit'
        end
    end

    def destroy

    end

    private
		def issue_link_params
			params.require(:issue_link).permit(:title, :issue_link)
		end

end
