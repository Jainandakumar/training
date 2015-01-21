class AddAttachmentPhotoToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :photo_file_name, :string
    add_column :images, :photo_file_size, :integer
    add_column :images, :photo_content_type, :string
    add_column :images, :photo_updated_at, :datetime

end

  def self.down

  end
end
