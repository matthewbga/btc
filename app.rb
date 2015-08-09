require './initialization.rb'
exchanges.each do |name, exchange|
  exchange.refresh_data
end
byebug
