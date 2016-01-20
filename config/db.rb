ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     ENV['BTC_DB_URL'],
  username: ENV['BTC_DB_USER'],
  password: ENV['BTC_DB_PW'],
  database: ENV['BTC_DB_NAME'],
  port: '5432'
)
