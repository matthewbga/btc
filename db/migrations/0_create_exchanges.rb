class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :price_url
      t.decimal :fee, precision: 8, scale: 8
      t.timestamps
    end
  end
end
