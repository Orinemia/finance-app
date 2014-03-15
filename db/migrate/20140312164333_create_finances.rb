class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.string :name
      t.string :sector
      t.float :price
      t.float :dividend_yield
      t.float :price_earnings
      t.float :earnings_share
      t.float :book_value
      t.float :year_week_low
      t.float :year_week_high
      t.float :market_cap
      t.float :ebitda

      t.timestamps
    end
  end
end
