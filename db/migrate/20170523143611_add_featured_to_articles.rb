class AddFeaturedToArticles < ActiveRecord::Migration
  def change
      add_column :articles, :featured, :integer, :default => 0
  end
end
