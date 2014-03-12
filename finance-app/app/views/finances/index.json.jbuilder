json.array!(@finances) do |finance|
  json.extract! finance, :id, :name, :sector, :price, :dividend_yield, :price_earnings, :earnings_share, :book_value, :year_week_low, :year_week_high, :market_cap, :ebitda
  json.url finance_url(finance, format: :json)
end
