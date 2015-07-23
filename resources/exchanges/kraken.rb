class Kraken < Exchange
  private
  def data_formatter
    @raw_data["result"].each do |key, data|
     @pair = Pair.new("BTC", key[5..7], data["a"][0].to_f, data["b"][0].to_f, data["c"][0].to_f)
     @pairs << @pair
    end
  end
end
