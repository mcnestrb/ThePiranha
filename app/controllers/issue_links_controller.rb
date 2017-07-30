require 'link_thumbnailer'

class IssueLinksController < ApplicationController
    before_action :authenticate_editor!, except: [:show, :index]

    def index
        if params[:year]
            @issue_links = IssueLink.by_year(params[:year])
        else
            @issue_links = IssueLink.all
        end
        @years = IssueLink.select("date").order('date desc').map{ |i| i.date.year }.uniq
        @year = params[:year]
    end

    def show
        @issue_link = IssueLink.find(params[:id])
    end

    def new
        @issue_link = IssueLink.new
    end

    def create
        @issue_link = IssueLink.new(issue_link_params)
        object = LinkThumbnailer.generate(@issue_link.issue_link)
        @issue_link.title = object.title
        @issue_link.thumbnail_link = object.images.first.src.to_s
        @issue_link.date = object.description.split('Published: ').second

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
        object = LinkThumbnailer.generate(params[:issue_link][:issue_link])
        params[:issue_link][:title] = object.title
        params[:issue_link][:thumbnail_link] = object.images.first.src.to_s
        params[:issue_link][:date] = object.description.split('Published: ').second

        if @issue_link.update(issue_link_params)
            redirect_to @issue_link
        else
            render 'edit'
        end
    end

    def destroy
        @issue_link = IssueLink.find(params[:id])
		@issue_link.destroy

		redirect_to issue_links_path
    end

    private
		def issue_link_params
			params.require(:issue_link).permit(:issue_link, :title, :date, :thumbnail_link)
		end

end
