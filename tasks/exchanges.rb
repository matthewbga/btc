namespace :exchanges do
  desc 'Populate exchanges table'
  task :populate do
    exchanges = [
      {
        name: 'Kraken',
        fee: 0.350000000000000,
        price_url: 'https://api.kraken.com/0/public/Ticker?pair=XXBTZEUR,XXBTZUSD,XXBTZCAD,XXBTZGBP,XXBTZJPY',
        created_at: DateTime.now,
        updated_at: DateTime.now
      },
      {
        name: 'Bitstamp',
        fee: 0.250000000000000,
        price_url: 'https://www.bitstamp.net/api/ticker/',
        created_at: DateTime.now,
        updated_at: DateTime.now
      },
      {
        name: 'BTC-e',
        fee: 0.300000000000000,
        price_url: 'https://btc-e.com/api/3/ticker/btc_usd-btc_eur',
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
    ]
    exchanges.each do |e|
      Exchange.create!(e)
    end
  end
end
