START_TIME = Time.new(1,1,1,17,0,0)
END_TIME = Time.new(1,1,2,4,0,0)

def intro
  system('cls')
  puts "Welcome to the Babysitter Wage Calculator v1.0.1
  \n*note* For this app please use Military Time format.
      (add 12 to the hr for pm values. ex 5pm would be 17:00)
      visit http://www.spacearchive.info/military.htm for more info\n\n"
end

def hrs_check(hr, min)
  case
  when (17..23).include?(hr) then Time.new(1,1,1,hr,min,0)
  when (0..4).include?(hr) then Time.new(1,1,2,hr,min,0)
  end
end

def in_check(hr, min)
  (START_TIME..END_TIME).include?(hrs_check(hr, min)) ? hrs_check(hr, min) : clock_in
end

def out_check(hr, min)
  (START_TIME..END_TIME).include?(hrs_check(hr, min)) ? hrs_check(hr, min) : clock_out
end

def clock_in
  puts "What hour did you start working?\n*note: if you started at 6:30pm, (18:30) enter '18' or for 22:00 enter '22'; for midnight enter 0"
  puts "Start & End times MUST be between 5pm(1700) and 4am(0400)"
  hr = gets.chomp.to_i
  puts "\nwhat minute mark of that hour did you start working?\n*note: if you started at 6:30pm, (18:30) enter '30' or for 22:15 enter '15'"
  min = gets.chomp.to_i
  in_check(hr, min)
end

def clock_out
  puts "\nWhat hour did you stop working? (for midnight enter 0)"
  puts "Start & End times MUST be between 5pm(1700) and 4am(0400)"
  hr = gets.chomp.to_i
  puts "\nWhat minute mark of that hour did you stop working?"
  min = gets.chomp.to_i
  out_check(hr, min)
end
