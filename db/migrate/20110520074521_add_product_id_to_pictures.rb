class AddProductIdToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :product_id, :integer
  end

  def self.down
    remove_column :pictures, :product_id
  end
end