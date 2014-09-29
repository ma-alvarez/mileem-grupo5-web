class ChangeIntegerForPrice < ActiveRecord::Migration
  def self.up
    change_column :publications, :price, :integer
  end
 
  def self.down
    change_column :publications, :price, :decimal
  end
end
