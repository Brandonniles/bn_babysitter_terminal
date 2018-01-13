system('cls')
puts "Welcome to the Babysitter Wage Calculator v1.0.1

*note* for this app please use MilitaryTime Format.
(add 12 to the hr for pm values. ex 5pm would be 17:00)
visit http://www.spacearchive.info/military.htm for more info\n\n"

BEDTIME = Time.new(1,1,1,21,0,0)
MIDNIGHT = Time.new(1,1,2,0,0,0)

def clock_in
  puts "What hour did you start working?\n*note: if you started at 6:30pm, (18:30) enter '18' or for 22:00 enter '22'; for midnight enter 0"
  hr = gets.chomp.to_i
  puts "\nwhat minute mark of that hour did you start working?\n*note: if you started at 6:30pm, (18:30) enter '30' or for 22:15 enter '15'"
  min = gets.chomp.to_i
  (17..23).include?(hr) ? ci = Time.new(1,1,1,hr,min,0) : ci = Time.new(1,1,2,hr,min,0)
  return ci
end

def clock_out
  puts "\nWhat hour did you stop working? (for midnight enter 0)"
  hr = gets.chomp.to_i
  puts "\nWhat minute mark of that hour did you stop working?"
  min = gets.chomp.to_i
  (17..23).include?(hr) ? co = Time.new(1,1,1,hr,min,0) : co = Time.new(1,1,2,hr,min,0)
  return co
end
# def before_bedtime_wages(ci_time, co_time)
#   hrs = 0
#   hrs = (co_time - ci_time).to_i/3600 if co_time <= BEDTIME && ci_time < BEDTIME
#   hrs = (BEDTIME - ci_time).to_i/3600 if co_time > BEDTIME && ci_time < BEDTIME
#   wages = hrs*12
#   return wages
# end
#which looks better / clearner, the above version or the below version
def before_bedtime_wages(ci_time, co_time)
  if co_time <= BEDTIME && ci_time < BEDTIME
    wages = ((co_time - ci_time).to_i/3600)*12
  elsif co_time > BEDTIME && ci_time < BEDTIME
    wages = ((BEDTIME - ci_time).to_i/3600)*12
  else
    wages = 0
  end
  return wages
end
#the above method returns a variable and the method below does not as a talking point.
#clean and concise? or clarity?
def bedtime_wages(ci_time, co_time)
  if ci_time >= BEDTIME && co_time <= MIDNIGHT
    return ((co_time - ci_time).to_i/3600)*8
  elsif ci_time < BEDTIME && (BEDTIME..MIDNIGHT).include?(co_time)
    return ((co_time - BEDTIME).to_i/3600)*8
  elsif (BEDTIME..MIDNIGHT).include?(ci_time) && co_time > MIDNIGHT
    return ((MIDNIGHT - ci_time).to_i/3600)*8
  elsif ci_time < BEDTIME && co_time > MIDNIGHT
    return ((MIDNIGHT - BEDTIME).to_i/3600)*8
  else
    #when both times are before BEDTIME or both after midnight
    return 0
  end
end

def post_midnight_wages(ci_time, co_time)
  if ci_time > MIDNIGHT && co_time > MIDNIGHT
    return ((co_time - ci_time).to_i/3600)*16
  elsif ci_time < MIDNIGHT && co_time > MIDNIGHT
    return ((co_time - MIDNIGHT).to_i/3600)*16
  else
    return 0
  end
end

#before the tests were ran this method only returned 'total'
#after they passed this method changed to print the total in a more readable format
def total_wages(ci_time, co_time)
  total = before_bedtime_wages(ci_time, co_time) + bedtime_wages(ci_time, co_time) + post_midnight_wages(ci_time, co_time)
  puts "You earned $#{total} in wages"
  return "You earned $#{total} in wages"
end

total_wages(clock_in, clock_out)
