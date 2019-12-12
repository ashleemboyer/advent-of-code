load '../intcode-computer.rb'

input = File.open("input.txt") { |f| f.readline }
@instructions = input.split(",").map { |n| n.to_i }

def part_1
  instructions_copy = @instructions.dup
  computer1 = IntcodeComputer.new(instructions_copy, 12, 2)
  computer1.run_instructions
  computer1.instructions[0]
end

def part_2
  (0..99).each { |noun|
    (0..99).each { |verb|
    instructions_copy = @instructions.dup
      computer2 = IntcodeComputer.new(instructions_copy, noun, verb)
      computer2.run_instructions
      return 100 * noun + verb if computer2.instructions[0] == 19690720
    }
  }
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"