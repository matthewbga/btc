module Discrepencies
  def self.get_discrepencies(exchanges)
    possible_trades = Array.new
    exchanges.each do |fname, fe|
      exchanges.each do |sname, se|
        if fe.name != se.name
          fe.pairs.each do |fp|
            se.pairs.each do |sp|
              if fp.quote.code == sp.quote.code && fp.base.code == sp.base.code
                if fp.bid > sp.ask
                  discrepency = fp.bid - sp.ask
                  trade = {
                    "base" => fp.base.code,
                    "quote" => fp.quote.code,
                    "buy" => sname,
                    "sell" => fname,
                    "diff" => discrepency
                  }
                  possible_trades << trade
                end
              end
            end
          end
        end
      end
    end
    return possible_trades
  end
end
