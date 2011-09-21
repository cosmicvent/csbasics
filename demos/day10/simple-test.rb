def sum(first, second)
  first - second
end

def assert(condition, message)
  if !condition
    puts "ERROR: #{message}"
  end
end

assert(sum(5, 6) == 11, "ERROR: sum of 5 and 6 should be 11")
assert(sum(5.4, 5) == 10.4, "ERROR: sum of 5.4 and 5 should be 10.4")
