class CreateFileAttachments < ActiveRecord::Migration
  def self.up
    create_table :file_attachments do |t|
      t.references  :owner, :polymorphic => true
      t.integer       :position
      t.boolean       :visible
      t.string        :file_file_name
      t.string        :file_content_type
      t.integer       :file_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :file_attachments
  end
end
