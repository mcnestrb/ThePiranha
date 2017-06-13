class AddConfirmableToDevise < ActiveRecord::Migration
  def self.up
    add_column :editors, :confirmation_token,   :string
    add_column :editors, :confirmed_at,         :datetime
    add_column :editors, :confirmation_sent_at, :datetime
    add_column :editors, :unconfirmed_email,    :string

    add_index  :editors, :confirmation_token, :unique => true
  end

  def self.down
    remove_index  :editors, :confirmation_token

    remove_column :editors, :unconfirmed_email
    remove_column :editors, :confirmation_sent_at
    remove_column :editors, :confirmed_at
    remove_column :editors, :confirmation_token
  end
end
