class Db
  include Singleton
  attr_reader :client
  def initialize
    @connection = {
      host: ENV['BTC_DB_URL'],
      dbname: ENV['BTC_DB_NAME'],
      user: ENV['BTC_DB_USER'],
      password: ENV['BTC_DB_PW'],
      port: '5432'
    }
  end

  def execute(sql)
    @client = PGconn.new(@connection)
    @client.exec(sql)
  end
end
