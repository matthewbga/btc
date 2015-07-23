class Pair
  def initialize(base, quote, ask=1, bid=1, close=1)
    @base = Currency.new(base)
    @quote = Currency.new(quote)
    @ask = ask
    @bid = bid
    @close = close
  end

  def base
    @base
  end

  def quote
    @quote
  end

  def ask
    @ask
  end

  def bid
    @bid
  end

  def close
    @close
  end
end
