BEDTIME = Time.new(1,1,1,21,0,0)
MIDNIGHT = Time.new(1,1,2,0,0,0)
SECONDS = 3600

def intro
  system('cls')
  puts "Welcome to the Babysitter Wage Calculator v1.0.1
  \n*note* For this app please use Military Time format.
      (add 12 to the hr for pm values. ex 5pm would be 17:00)
      visit http://www.spacearchive.info/military.htm for more info\n\n"
end

def clock_in
  puts "What hour did you start working?\n*note: if you started at 6:30pm, (18:30) enter '18' or for 22:00 enter '22'; for midnight enter 0"
  hr = gets.chomp.to_i
  puts "\nwhat minute mark of that hour did you start working?\n*note: if you started at 6:30pm, (18:30) enter '30' or for 22:15 enter '15'"
  min = gets.chomp.to_i
  (17..23).include?(hr) ? ci = Time.new(1,1,1,hr,min,0) : ci = Time.new(1,1,2,hr,min,0)
end

def clock_out
  puts "\nWhat hour did you stop working? (for midnight enter 0)"
  hr = gets.chomp.to_i
  puts "\nWhat minute mark of that hour did you stop working?"
  min = gets.chomp.to_i
  (17..23).include?(hr) ? co = Time.new(1,1,1,hr,min,0) : co = Time.new(1,1,2,hr,min,0)
end

def before_bedtime_wages(ci_time, co_time)
  case
  when co_time <= BEDTIME && ci_time < BEDTIME then ((co_time - ci_time).to_i/SECONDS)*12
  when co_time > BEDTIME && ci_time < BEDTIME then ((BEDTIME - ci_time).to_i/SECONDS)*12
  when ci_time >= BEDTIME then 0
  end
end

def bedtime_wages(ci_time, co_time)
  case
  when ci_time >= BEDTIME && co_time <= MIDNIGHT then ((co_time - ci_time).to_i/SECONDS)*8
  when ci_time < BEDTIME && (BEDTIME..MIDNIGHT).include?(co_time) then ((co_time - BEDTIME).to_i/SECONDS)*8
  when (BEDTIME..MIDNIGHT).include?(ci_time) && co_time > MIDNIGHT then ((MIDNIGHT - ci_time).to_i/SECONDS)*8
  when ci_time < BEDTIME && co_time > MIDNIGHT then ((MIDNIGHT - BEDTIME).to_i/SECONDS)*8
  when !(BEDTIME..MIDNIGHT).include?(ci_time && co_time) then 0
  end
end

def post_midnight_wages(ci_time, co_time)
  case
  when ci_time > MIDNIGHT && co_time > MIDNIGHT then ((co_time - ci_time).to_i/SECONDS)*16
  when ci_time < MIDNIGHT && co_time > MIDNIGHT then ((co_time - MIDNIGHT).to_i/SECONDS)*16
  when  co_time <= MIDNIGHT then 0
  end
end

def total_wages(ci_time, co_time)
  total =
    before_bedtime_wages(ci_time, co_time) +
    bedtime_wages(ci_time, co_time) +
    post_midnight_wages(ci_time, co_time)
end
