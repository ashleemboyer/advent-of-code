class IntcodeComputer
  attr_reader :instructions

  def initialize(instructions, noun, verb)
    @instructions = instructions
    @instructions[1] = noun
    @instructions[2] = verb
  end

  def run_instructions
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
  end
end