# @bedtime = Time.new(1,1,1,21,0,0)
# @midnight = Time.new(1,1,2,0,0,0)

def clock_in
  puts "What hour did you start working?
  \n*note: Please use MilitaryTime format. visit: http://www.spacearchive.info/military.htm for info
  \n*note: if you started at 6:30, enter '6' or for 22:00 enter '22' "
  hr = gets.chomp.to_i
  puts "what minute mark of that hour did you start working?
  \n*note: if you started at 6:30, enter '30' or for 22:15 enter '15'"
  min = gets.chomp.to_i
  ci = Time.new(1,1,1,hr,min,0)
  return ci
end

# def before_bedtime_wages(ci_time, co_time)
#
#   hrs = 0
#   hrs = (co_time - ci_time)/3600 if co_time < @bedtime && ci_time < @bedtime
#   hrs = (@bedtime - ci_time)/3600 if co_time > @bedtime && ci_time < @bedtime
#   wages = hrs*12
#   return wages
# end
#which looks better / clearner, the above version or the below version
def before_bedtime_wages(ci_time, co_time)
  @bedtime = Time.new(1,1,1,21,0,0)
  if co_time <= @bedtime && ci_time < @bedtime
    hrs = (co_time - ci_time).to_i/3600
  elsif co_time > @bedtime && ci_time < @bedtime
    hrs = (@bedtime - ci_time).to_i/3600
  else
    hrs = 0
  end
  wages = hrs*12
  return wages
end

def bedtime_wages(ci_time, co_time)
  @bedtime = Time.new(1,1,1,21,0,0)
  @midnight = Time.new(1,1,2,0,0,0)
  if ci_time >= @bedtime && co_time <= @midnight
    hrs = (co_time - ci_time).to_i/3600
  elsif ci_time < @bedtime && (@bedtime <= co_time && co_time <= @midnight)
    hrs = (co_time - @bedtime).to_i/3600
  elsif (@bedtime <= ci_time && ci_time <= @midnight) && co_time > @midnight
    hrs = (@midnight - ci_time).to_i/3600
  else
    #when both times are before @bedtime or both after midnight
    hrs = 0
  end
  wages = hrs*8
  return wages
end

def post_midnight_wages(ci_time, co_time)
  @midnight = Time.new(1,1,2,0,0,0)
  if ci_time > @midnight && co_time > @midnight
    hrs = (co_time - ci_time).to_i/3600
  elsif ci_time < @midnight && co_time > @midnight
    hrs = (co_time - @midnight).to_i/3600
  else
    hrs = 0
  end
  wages = hrs*16
  return wages
end
