def get_fuel_requirement(n)
  (n / 3).floor - 2
end

def part_1
  sum = 0
  File.open("input.txt").each do |line|
    sum += get_fuel_requirement(line.to_f)
  end
  sum
end

def part_2
  sum = 0
  File.open("input.txt").each do |line|
    fuel_requirement = get_fuel_requirement(line.to_f)
    until fuel_requirement <= 0 do
      sum += fuel_requirement
      fuel_requirement = get_fuel_requirement(fuel_requirement)
    end
  end
  sum
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"