class CreateAuthors < ActiveRecord::Migration
  def create
  create_table :authors do |t|
  t.string :name
  t.string :email
  t.timestamps 
  end
end
