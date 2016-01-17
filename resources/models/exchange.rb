class Exchange
  include Utils
  attr_reader :price_url
  attr_reader :name
  attr_reader :raw_data

  def self.all
    Utils::db.execute('select * from exchanges')
  end

  def initialize(config)
    @pairs = []
    @name = config['name']
    @price_url = config['price_url']
    @fee = config['fee']
    refresh_data
    data_formatter
  end

  def refresh_data
    @raw_data = http_client.getreq(@price_url)
  end

  attr_reader :pairs

  def info
    formatted = ''
    pairs.each do |pair|
      formatted += "#{pair.base.code} - #{pair.quote.code}:\n Ask: #{pair.ask}\n Bid: #{pair.bid}\n Close: #{pair.close}\n"
    end
    formatted
  end
end
