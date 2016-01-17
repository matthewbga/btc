require 'yaml'
require 'colorize'
require 'json'
require 'byebug'
require 'singleton'
require 'pg'
require 'net/http'

puts 'Initializing...'.blue
require './resources/db.rb'
require './resources/utils.rb'
Dir.glob('./resources/*/**/*.rb', &method(:require))
exchanges = {}
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
