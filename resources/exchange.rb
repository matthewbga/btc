class Exchange
  def initialize(config)
    @pairs = Array.new
    @name = config["name"]
    @price_url = config["price_url"]
    @fee = config["fee"]
    self.refresh_data
    data_formatter
  end

  def get_raw
    @raw_data
  end

  def price_url
    @price_url
  end

  def name
    @name
  end

  def refresh_data
    @raw_data = http_client.getreq(@price_url)
  end

  def pairs
    @pairs
  end

  def info
    formatted = ""
    self.pairs.each do |pair|
      formatted += "#{pair.base.code} - #{pair.quote.code}:\n Ask: #{pair.ask}\n Bid: #{pair.bid}\n Close: #{pair.close}\n"
    end
    return formatted
  end
end
