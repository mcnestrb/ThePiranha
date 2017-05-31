class RemoveVerifiedFromAdminsAgain < ActiveRecord::Migration
  def change
      remove_column :admins, :verified
  end
end
