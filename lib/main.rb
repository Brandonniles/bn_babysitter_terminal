require_relative './methods'

intro
# puts "You earned $#{before_bedtime_wages(clock_in, clock_out)} in wages before bedtime."
# puts "You earned $#{bedtime_wages(clock_in, clock_out)} in wages from bedtime to midnight."
# puts "You earned $#{post_midnight_wages(clock_in, clock_out)} in wages after midnight."
puts "You earned $#{total_wages(clock_in, clock_out)} in total wages."
