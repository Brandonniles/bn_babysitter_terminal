BEDTIME = Time.new(1,1,1,21,0,0)
MIDNIGHT = Time.new(1,1,2,0,0,0)

def clock_in
  puts "What hour did you start working?
  \n*note: Please use MilitaryTime format. visit: http://www.spacearchive.info/military.htm for info
  \n*note: if you started at 6:30pm, (18:30) enter '18' or for 22:00 enter '22'
  \n for midnight enter 0 "
  hr = gets.chomp.to_i
  puts "what minute mark of that hour did you start working?
  \n*note: if you started at 6:30pm, (18:30) enter '30' or for 22:15 enter '15'"
  min = gets.chomp.to_i
  (17..23).include?(hr) ? ci = Time.new(1,1,1,hr,min,0) : ci = Time.new(1,1,2,hr,min,0)
  return ci
end

def clock_out
  puts "*note please use the MilitaryTime format
  \n What hour did you stop working?
  \n for midnight enter 0"
  hr = gets.chomp.to_i
  puts "What minute mark of that hour did you stop working?"
  min = gets.chomp.to_i
  (17..23).include?(hr) ? co = Time.new(1,1,1,hr,min,0) : co = Time.new(1,1,2,hr,min,0)
  return co
end
def before_bedtime_wages(ci_time, co_time)

  hrs = 0
  hrs = (co_time - ci_time).to_i/3600 if co_time <= BEDTIME && ci_time < BEDTIME
  hrs = (BEDTIME - ci_time).to_i/3600 if co_time > BEDTIME && ci_time < BEDTIME
  wages = hrs*12
  return wages
end
#which looks better / clearner, the above version or the below version
# def before_bedtime_wages(ci_time, co_time)
#   if co_time <= BEDTIME && ci_time < BEDTIME
#     hrs = (co_time - ci_time).to_i/3600
#   elsif co_time > BEDTIME && ci_time < BEDTIME
#     hrs = (BEDTIME - ci_time).to_i/3600
#   else
#     hrs = 0
#   end
#   wages = hrs*12
#   return wages
# end

def bedtime_wages(ci_time, co_time)
  if ci_time >= BEDTIME && co_time <= MIDNIGHT
    hrs = (co_time - ci_time).to_i/3600
  elsif ci_time < BEDTIME && (BEDTIME <= co_time && co_time <= MIDNIGHT)
    hrs = (co_time - BEDTIME).to_i/3600
  elsif (BEDTIME <= ci_time && ci_time <= MIDNIGHT) && co_time > MIDNIGHT
    hrs = (MIDNIGHT - ci_time).to_i/3600
  else
    #when both times are before BEDTIME or both after midnight
    hrs = 0
  end
  wages = hrs*8
  return wages
end

def post_midnight_wages(ci_time, co_time)
  if ci_time > MIDNIGHT && co_time > MIDNIGHT
    hrs = (co_time - ci_time).to_i/3600
  elsif ci_time < MIDNIGHT && co_time > MIDNIGHT
    hrs = (co_time - MIDNIGHT).to_i/3600
  else
    hrs = 0
  end
  wages = hrs*16
  return wages
end
