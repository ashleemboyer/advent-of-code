@min = 168630
@max = 718098

def meets_criteria? pass
  return false if pass.length != 6

  digits = pass.split("")

  has_adjacents = false
  digits.each { |digit|
    has_adjacents = true if pass.include?("#{digit}#{digit}")
  }

  sorted_digits = digits.sort.join
  return false if sorted_digits != pass

  has_adjacents
end

def part_1
  count = 0
  (@min..@max).each { |pass|
    count += 1 if meets_criteria?(pass.to_s)
  }
  count
end

puts "Part 1: #{part_1}"