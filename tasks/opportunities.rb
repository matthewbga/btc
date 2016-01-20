namespace :opportunities do
  desc 'Check for arbitrage opportunities'
  task :check do
    opportunities = Discrepencies.calculate(Exchange.all)
    opportunities.each do |o|
      Opportunity.create!(o)
    end
  end
end
