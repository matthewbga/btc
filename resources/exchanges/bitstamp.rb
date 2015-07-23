class Bitstamp < Exchange
  private
  def data_formatter
    @pair = Pair.new("BTC", "USD", @raw_data["ask"].to_f, @raw_data["bid"].to_f, @raw_data["last"].to_f)
    @pairs << @pair
  end
end
