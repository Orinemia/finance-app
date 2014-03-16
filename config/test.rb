
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)

allstate = []
f = File.open("company.txt", "r") #open the data file
f.each_line do |line| 
   @temp = line.split(",") #seperate each item by comma

   if @temp.size == 12
      state = @temp[11].delete!"\""
      # "<option value=\"#{@temp[11].delete!'\"'}\">#{@temp[11].delete!'\"'}</option>"#as locations contain comma, I used gsub to keep only alphebets and spaces
      # state = "<option value=\"#{state}\">#{state}</option>"
   end

   if @temp.size == 13
      state = @temp[12].delete!"\""
      # state = "<option value=\"#{@temp[12].delete!'\"'}\">#{@temp[12]..delete!'\"'}</option>"
      state[0] = ''
      # state = "<option value=\"#{state}\">#{state}</option>"
   end
   # puts allstate.include?(state)
   if allstate.include?(state) == false
      state = state.to_s
      allstate.insert(0, state)
      # puts allstate
      # print state
   end
   

end

a = allstate.sort_by{|word| word.downcase}
a.each do |word|
   puts "<option value=\"#{word.chomp}\">#{word.chomp}</option>"
end
f.close #close file