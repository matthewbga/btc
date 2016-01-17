module Utils
  def http_client
    @http_client || HttpClient.new
  end

  def exchanges
    return @exchanges if @exchanges
    puts 'Configuring Exchanges...'.blue
    @client.exec('select * from exchanges')
  end

  def db
    DB.instance
  end
end
