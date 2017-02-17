class IssueLink < ActiveRecord::Base
    before_validation :smart_add_url_func

    protected

        def smart_add_url_func
            unless self.issue_link[/\Ahttp:\/\//] || self.issue_link[/\Ahttps:\/\//]
                self.issue_link = "http://#{self.issue_link}"
            end
        end
end
