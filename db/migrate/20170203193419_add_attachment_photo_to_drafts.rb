class AddAttachmentPhotoToDrafts < ActiveRecord::Migration
  def self.up
    change_table :drafts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :drafts, :photo
  end
end
