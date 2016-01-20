class Pair
  def initialize(base, quote, ask = 1, bid = 1, close = 1)
    @base = base
    @quote = quote
    @ask = ask
    @bid = bid
    @close = close
  end

  attr_reader :base

  attr_reader :quote

  attr_reader :ask

  attr_reader :bid

  attr_reader :close
end
