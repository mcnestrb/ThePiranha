class RemoveVerifiedFromEditorsOnceMore < ActiveRecord::Migration
  def change
      remove_column :editors, :verified
  end
end
