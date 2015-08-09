require 'yaml'
require 'colorize'
require 'json'
require 'byebug'

puts "Initializing...".blue
Dir.glob('./resources/*.rb', &method(:require))
Dir.glob('./resources/*/*.rb', &method(:require))
Dir.glob('./services/*.rb', &method(:require))
require './config/db.rb'

puts "Defining globals...".blue
# Def globals
def http_client
  @http_client || HttpClient.new
end

def exchanges
  @exchanges ||= {}
end

puts "Configuring Exchanges...".blue
exchanges_config = YAML.load_file('./config/exchanges.yml')
exchanges_config.each do |config|
  puts "Configuring #{config["name"]}...".blue
  case config["name"]
  when "Kraken"
    newex = Kraken.new(config)
  when "Bitstamp"
    newex = Bitstamp.new(config)
  when "BTC-e"
    newex = Btce.new(config)
  else
  end
  exchanges[config["name"]] = newex if defined?(newex)
end
