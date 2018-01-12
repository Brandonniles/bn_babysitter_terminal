@bedtime = Time.new(1,1,1,21,0,0)

def clock_in
  puts "What hour did you start working?
  \n*note: Please use MilitaryTime format. visit: http://www.spacearchive.info/military.htm for info
  \n*note: if you started at 6:30, enter '6' or for 22:00 enter '22' "
  input_hr = gets.chomp.to_i
  return input_hr
end

def before_bedtime_wages(ci_time, co_time)
  hrs = 0
  hrs = (co_time - ci_time)/3600 if co_time < @bedtime && ci_time < @bedtime
  hrs = (@bedtime - ci_time)/3600 if co_time > @bedtime && ci_time < @bedtime
  wages = hrs*12
  return wages
end
#which looks better / clearner, the above version or the below version
def before_bedtime_wages(ci_time, co_time)
  if co_time < @bedtime && ci_time < @bedtime
    hrs = (co_time - ci_time)/3600
  elsif co_time > @bedtime && ci_time < @bedtime
    hrs = (@bedtime - ci_time)/3600
  else
    hrs = 0
  end
  wages = hrs*12
  return wages
end
