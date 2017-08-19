class IssueLink < ActiveRecord::Base
    validates_format_of :issue_link, :with => /(issuu\.com\/)(the)?(piranha)/, :on => [:create, :update]
    validates :issue_link, uniqueness: true, :on => [:create, :update]
    before_validation :smart_add_url_func

    def self.by_year(year)
        where('extract(year from date) = ?', year)
    end

    protected

        def smart_add_url_func
            unless self.issue_link[/\Ahttp:\/\//] || self.issue_link[/\Ahttps:\/\//]
                self.issue_link = "http://#{self.issue_link}"
            end
        end
end
