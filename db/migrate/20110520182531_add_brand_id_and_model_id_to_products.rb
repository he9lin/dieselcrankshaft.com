class AddBrandIdAndModelIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :brand_id, :integer
    add_column :products, :model_id, :integer
  end

  def self.down
    remove_column :products, :model_id
    remove_column :products, :brand_id
  end
end
