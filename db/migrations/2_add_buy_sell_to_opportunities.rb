class AddBuySellToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :buy, :string
    add_column :opportunities, :sell, :string
  end
end
