
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)


f = File.open("company.txt", "r") #open the data file
f.each_line do |line| 
   @temp = line.split(",") #seperate each item by comma
   name = @temp[0]
   sector = @temp[1]
   price = @temp[2]
   dividend_yield = @temp[3]
   price_earnings = @temp[4]
   earnings_share = @temp[5]
   book_value = @temp[6]
   year_week_low = @temp[7]
   year_week_high = @temp[8]
   market_cap = @temp[9]
   ebitda = @temp[10]
   location = @temp[11]#as locations contain comma, I used gsub to keep only alphebets and spaces
   if @temp.size == 13
      location = "#{@temp[11].delete!"\""}, #{@temp[12].delete!"\""}"
      location = location.chomp
   end
   @finance = Finance.new
   @finance.name = name
   @finance.sector = sector
   @finance.price = price
   @finance.dividend_yield = dividend_yield
   @finance.price_earnings = price_earnings
   @finance.earnings_share = earnings_share
   @finance.book_value = book_value
   @finance.year_week_low = year_week_low
   @finance.year_week_high = year_week_high
   @finance.market_cap = market_cap
   @finance.ebitda = ebitda
   @finance.location = location.to_s
   @finance.save
   puts name
   puts @temp.size
end

f.close #close file