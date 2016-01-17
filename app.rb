require './initialization.rb'
@exchanges.each do |_name, exchange|
  exchange.refresh_data
  possible_trades = Discrepencies.calculate(@exchanges)
  possible_trades.each do |trade|
    timestamp = DateTime.now
    base = trade[:base]
    quote = trade[:quote]
    buy = trade[:buy]
    sell = trade[:sell]
    diff = trade[:diff]
    query = "insert into opportunities
            (created_at, base_price, quote_price, buy_at, sell_at, diff) values
            '#{timestamp}', #{base}, #{quote}, '#{buy}', '#{sell}', #{diff}"
    Utils.db.execute(query)
  end
end
