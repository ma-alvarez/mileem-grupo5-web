class ChangeIntegerForArea < ActiveRecord::Migration
  def self.up
    change_column :publications, :area, :integer
  end
 
  def self.down
    change_column :publications, :area, :decimal
  end
end
