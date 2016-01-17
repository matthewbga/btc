#!/usr/bin/env ruby
require_relative './initialization.rb'
@exchanges.each do |_name, exchange|
  exchange.refresh_data
end

possible_trades = Discrepencies.calculate(@exchanges)
possible_trades.each do |trade|
  timestamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
  base = trade[:base]
  quote = trade[:quote]
  buy = trade[:buy]
  sell = trade[:sell]
  diff = trade[:diff]
  buy_price = trade[:buy_price]
  sell_price = trade[:sell_price]
  query = "insert into opportunities
          (created_at,
          base, quote,
          buy_at,
          sell_at,
          diff,
          buy_price,
          sell_price) values
          ('#{timestamp}',
          '#{base}',
          '#{quote}',
          '#{buy}',
          '#{sell}',
          #{diff},
          #{buy_price},
          #{sell_price})"
  Utils.db.execute(query)
end
