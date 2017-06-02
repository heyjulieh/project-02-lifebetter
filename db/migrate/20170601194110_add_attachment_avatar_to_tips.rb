class AddAttachmentAvatarToTips < ActiveRecord::Migration[5.1]
  def self.up
    change_table :tips do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :tips, :avatar
  end
end
