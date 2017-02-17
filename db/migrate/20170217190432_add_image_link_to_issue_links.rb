class AddImageLinkToIssueLinks < ActiveRecord::Migration
  def change
      add_column :issue_links, :thumbnail_link, :string
  end
end
