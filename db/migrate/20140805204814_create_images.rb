class CreateImages < ActiveRecord::Migration
  def create
    create_table :images do |t|
    t.belongs_to :author
    t.string :image_name
    t.string :image_size
    t.timestamps 
    end
  end
end
