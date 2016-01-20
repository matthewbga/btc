class ChangeDecimals < ActiveRecord::Migration
  def change
    change_column :exchanges, :fee, :decimal, precision: 20, scale: 10
    change_column :opportunities, :bid, :decimal, precision: 20, scale: 10
    change_column :opportunities, :ask, :decimal, precision: 20, scale: 10
    change_column :opportunities, :spread, :decimal, precision: 20, scale: 10
  end
end
