class AddAttachmentLogoToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :links, :logo
  end
end
