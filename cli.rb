#!/usr/bin/env ruby
require_relative './initialization.rb'
@exchanges = Exchange.all
def main_loop
  @exited = false
  command = gets.chomp
  if command.downcase == 'p'
    @exchanges.each do |exchange|
      exchange.refresh_data
      puts '----------'.blue
      puts name.blue
      puts '----------'.blue
      puts exchange.info
    end
    puts '----------'.green
    puts 'DISCREPENCIES'.green
    puts '----------'.green
    puts Discrepencies.calculate(@exchanges)
    puts '----------'.green
  elsif command.downcase == 'e'
    @exited = true
  else
    puts 'Command not recognised.'
  end
  unless @exited
    puts "Press 'p' to print out the current data or 'e' to exit."
    main_loop
  end
end

puts 'Done!'.green
puts "Press 'p' to print out the current data or 'e' to exit."
main_loop
puts 'Bye'
