def run_instructions(noun, verb)
  input = File.open("input.txt") { |f| f.readline }
  instructions = input.split(",").map { |n| n.to_i }

  instructions[1] = noun
  instructions[2] = verb

  instruction_pointer = 0
  opcode = instructions[instruction_pointer]
  cant_run = instruction_pointer == instructions.length || opcode == 99

  until cant_run do
    input_1_address = instructions[instruction_pointer + 1]
    input_2_address = instructions[instruction_pointer + 2]
    result_address = instructions[instruction_pointer + 3]
    
    input_1 = instructions[input_1_address]
    input_2 = instructions[input_2_address]

    instructions[result_address] = opcode == 1 ?
      input_1 + input_2 :
      input_1 * input_2

    instruction_pointer += 4
    opcode = instructions[instruction_pointer]
    cant_run = instruction_pointer == instructions.length || opcode == 99
  end

  instructions[0]
end

def part_1
  run_instructions(12, 2)
end

def part_2
  (0..99).each { |noun|
    (0..99).each { |verb|
      result = run_instructions(noun, verb)
      return {noun: noun, verb: verb} if result == 19690720
    }
  }
end

puts "Part 1: #{part_1}"
puts "Part 2: #{100 * part_2[:noun] + part_2[:verb]}"