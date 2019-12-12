@min = 168630
@max = 718098

def meets_criteria?(pass, part_2=false)
  return false if pass.length != 6

  sorted_digits = pass.chars.sort.join
  return false if sorted_digits != pass

  has_adjacents = false
  if part_2
    # Credit goes to Mauri Mastonen for this portion. I didn't think about
    # using the "never decrease" rule as a precondition for this! Also
    # thanks for helping me learn a new method: inject.
    # Link: https://github.com/Kazhuu/advent-of-code-2019/blob/master/day04/main.rb#L25
    digit_count = pass.chars.inject(Hash.new(0)) { |digit_to_count, digit|
      digit_to_count[digit] += 1
      digit_to_count
    }
    has_adjacents = digit_count.has_value?(2)
  else
    pass.chars.each { |digit|
      has_adjacents = true if pass.include?("#{digit}#{digit}")
    }
  end

  has_adjacents
end

def part_1
  count = 0
  (@min..@max).each { |pass|
    count += 1 if meets_criteria?(pass.to_s)
  }
  count
end

def part_2
  count = 0
  (@min..@max).each { |pass|
    count += 1 if meets_criteria?(pass.to_s, true)
  }
  count
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"
