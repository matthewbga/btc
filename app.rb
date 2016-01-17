require './resources/initialization.rb'
exchanges.each do |_name, exchange|
  exchange.refresh_data
end
