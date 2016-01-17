class Exchange
  include Utils
  attr_reader :price_url
  attr_reader :name
  attr_reader :raw_data
  attr_reader :pairs

  def self.all
    Utils.db.execute('select * from exchanges')
  end

  def initialize(config)
    @pairs = []
    @name = config['name']
    @price_url = config['price_url']
    @fee = config['fee']
    refresh_data
  end

  def refresh_data
    @raw_data = Utils.http_client.getreq(@price_url)
    data_formatter
  end

  def info
    formatted = ''
    pairs.each do |pair|
      formatted += "#{pair.base.code} - #{pair.quote.code}:\n Ask: #{pair.ask}\n Bid: #{pair.bid}\n Close: #{pair.close}\n"
    end
    formatted
  end
end
