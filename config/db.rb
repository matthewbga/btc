require 'pg'
CONNECTION_DETAILS = {
  host: 'btc.cjxuip8fk3d2.us-west-2.rds.amazonaws.com',
  dbname: 'btcdb',
  user: 'btc',
  password: 'd!ng2580',
  port: '5432'
}
PGCONN = PGconn.new(CONNECTION_DETAILS)
