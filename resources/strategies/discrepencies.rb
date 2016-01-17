module Discrepencies
  def self.get_discrepencies(exchanges)
    possible_trades = []
    exchanges.each do |fname, fe|
      exchanges.each do |sname, se|
        next unless fe.name != se.name
        fe.pairs.each do |fp|
          se.pairs.each do |sp|
            next unless (fp.quote.code == sp.quote.code) &&
                        (fp.base.code == sp.base.code) &&
                        (fp.bid > sp.ask)
            discrepency = fp.bid - sp.ask
            trade = {
              'base' => fp.base.code,
              'quote' => fp.quote.code,
              'buy' => sname,
              'sell' => fname,
              'diff' => discrepency
            }
            possible_trades << trade
          end
        end
      end
    end
    possible_trades
  end
end
