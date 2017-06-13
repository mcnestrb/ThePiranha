class IssueLink < ActiveRecord::Base
    validates_format_of :issue_link, :with => /(issuu\.com\/piranhatcd)/, :on => [:create, :update]
    validates_uniqueness_of :issue_link, :on[:create, :update]
    before_validation :smart_add_url_func

    protected

        def smart_add_url_func
            unless self.issue_link[/\Ahttp:\/\//] || self.issue_link[/\Ahttps:\/\//]
                self.issue_link = "http://#{self.issue_link}"
            end
        end
end
