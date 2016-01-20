class Exchange < ActiveRecord::Base
  include Utils
  include DataFormatter
  attr_accessor :pairs

  after_initialize :refresh_data

  def refresh_data
    @pairs = []
    @raw_data = Utils.http_client.getreq(price_url)
    data_formatter
  end

  def info
    formatted = ''
    pairs.each do |pair|
      formatted += "#{pair.base} - #{pair.quote}:\n Ask: #{pair.ask}\n Bid: #{pair.bid}\n Close: #{pair.close}\n"
    end
    formatted
  end
end
