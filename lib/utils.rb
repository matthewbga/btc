module Utils
  def self.http_client
    HttpClient.instance
  end

  def self.db
    Db.instance
  end
end
