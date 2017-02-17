class CreateIssueLinks < ActiveRecord::Migration
  def change
    create_table :issue_links do |t|
      t.string :title
      t.string :issue_link
      t.timestamps null: false
    end
  end
end
