class IssueLinksChangeDateTimeToDate < ActiveRecord::Migration
    def up
      change_column :issue_links, :date, :date
    end

    def down
      change_column :issue_links, :date, :datetime
    end
end
