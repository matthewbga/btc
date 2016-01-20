module DataFormatter
  private

  def data_formatter
    btce_formatter if name == 'BTC-e'
    kraken_formatter if name == 'Kraken'
    bitstamp_formatter if name == 'Bitstamp'
  end

  def btce_formatter
    @raw_data.each do |key, data|
      pair = Pair.new(key[0..2].upcase,
                      key[4..6].upcase,
                      data['sell'].to_f,
                      data['buy'].to_f,
                      data['last'].to_f)
      @pairs << pair
    end
  end

  def kraken_formatter
    @raw_data['result'].each do |key, data|
      pair = Pair.new('BTC', key[5..7],
                      data['a'][0].to_f,
                      data['b'][0].to_f,
                      data['c'][0].to_f)
      @pairs << pair
    end
  end

  def bitstamp_formatter
    pair = Pair.new('BTC', 'USD',
                    @raw_data['ask'].to_f,
                    @raw_data['bid'].to_f,
                    @raw_data['last'].to_f)
    @pairs << pair
  end
end
