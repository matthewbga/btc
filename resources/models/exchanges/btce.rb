class Btce < Exchange
  private

  def data_formatter
    @raw_data.each do |key, data|
      @pair = Pair.new(key[0..2].upcase,
                       key[4..6].upcase,
                       data['sell'].to_f,
                       data['buy'].to_f,
                       data['last'].to_f)
      @pairs << @pair
    end
  end
end
