class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
			t.text :content
			t.string :author_name
			t.integer :type
			t.integer :issue
      t.timestamps null: false
    end
  end
end
