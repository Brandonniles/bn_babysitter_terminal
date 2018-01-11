def clock_in_hr
  puts "What hour did you start working?\n *note: if you started at 6:30, enter '6' "
  input_hr = gets.chomp.to_i
  return input_hr
end
