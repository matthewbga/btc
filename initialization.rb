require 'yaml'
require 'colorize'
require 'json'
require 'byebug'

puts 'Initializing...'.blue
Dir.glob('./resources/*.rb', &method(:require))
Dir.glob('./resources/*/*.rb', &method(:require))
exchanges_config = Exchange.all
exchanges_config.each do |config|
  puts "Configuring #{config['name']}...".blue
  case config['name']
  when 'Kraken'
    newex = Kraken.new(config)
  when 'Bitstamp'
    newex = Bitstamp.new(config)
  when 'BTC-e'
    newex = Btce.new(config)
  end
  exchanges[config['name']] = newex if defined?(newex)
end
