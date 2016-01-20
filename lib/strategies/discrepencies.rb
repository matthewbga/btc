module Discrepencies
  def self.calculate(exchanges)
    possible_trades = []
    exchanges.each do |fe|
      exchanges.each do |se|
        next unless fe.name != se.name
        fe.pairs.each do |fp|
          se.pairs.each do |sp|
            next unless (fp.quote == sp.quote) &&
                        (fp.base == sp.base) &&
                        (fp.bid > sp.ask)
            discrepency = fp.bid - sp.ask
            trade = {
              base: fp.base,
              quote: fp.quote,
              buy: se.name,
              sell: fe.name,
              bid: fp.bid,
              ask: sp.ask,
              spread: discrepency
            }
            possible_trades << trade
          end
        end
      end
    end
    possible_trades
  end
end
