class AddDateToIssueLinks < ActiveRecord::Migration
  def change
      add_column :issue_links, :date, :datetime
  end
end
