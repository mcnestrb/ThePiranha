class AddDeviseInvitableToEditor < ActiveRecord::Migration
  def change
        add_column :editors, :invitation_token, :string
        add_column :editors, :invitation_created_at, :datetime
        add_column :editors, :invitation_sent_at, :datetime
        add_column :editors, :invitation_accepted_at, :datetime
        add_column :editors, :invitation_limit, :integer
        add_column :editors, :invited_by_id, :integer
        add_column :editors, :invited_by_type, :string
        add_index :editors, :invitation_token, :unique => true

        # Allow null encrypted_password
        change_column_null :editors, :encrypted_password, :string, true
  end
end
