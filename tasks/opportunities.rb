namespace :opportunities do
  desc 'Check for arbitrage opportunities'
  task :check do
    opportunities = Discrepencies.calculate(Exchange.all)
    opportunities.each do |o|
      existing = Opportunity.where(o)
      if existing.empty?
        Opportunity.create(o)
      else
        existing.each do |eo|
          o.updated_at = DateTime.now
          o.save
        end
      end
    end
  end
end
