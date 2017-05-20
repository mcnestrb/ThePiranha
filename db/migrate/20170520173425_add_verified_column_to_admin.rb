class AddVerifiedColumnToAdmin < ActiveRecord::Migration
  def change
      add_column :admins, :verified, :string
  end
end
