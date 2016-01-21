get '/opportunities' do
  @opportunities = Opportunity.all.order('created_at DESC').limit(50)
  slim :opportunities
end
