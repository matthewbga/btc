class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :base
      t.string :quote
      t.decimal :ask, precision: 8, scale: 8
      t.decimal :bid, precision: 8, scale: 8
      t.decimal :spread, precision: 8, scale: 8
      t.timestamps
    end
  end
end
