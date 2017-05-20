class RemoveVerifiedFromAdmins < ActiveRecord::Migration
  def change
      remove_column :admins, :verified
      add_column :admins, :verified, :boolean
  end
end
