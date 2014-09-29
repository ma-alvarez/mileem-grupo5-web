class ChangeIntegerForExpenses < ActiveRecord::Migration
  def self.up
    change_column :publications, :expenses, :integer
  end
 
  def self.down
    change_column :publications, :expenses, :decimal
  end
end
