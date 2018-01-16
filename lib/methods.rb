BEDTIME = Time.new(1,1,1,21,0,0)
MIDNIGHT = Time.new(1,1,2,0,0,0)
SECONDS = 3600

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
