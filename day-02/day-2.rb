def part_1
  input = File.open("input.txt") { |f| f.readline }
  nums = input.split(",").map { |n| n.to_i }

  nums[1] = 12
  nums[2] = 2

  index = 0
  opcode = nums[index]
  cant_run = index == nums.length || opcode == 99

  until cant_run do
    input_1_position = nums[index + 1]
    input_2_position = nums[index + 2]
    store_position = nums[index + 3]
    
    input_1 = nums[input_1_position]
    input_2 = nums[input_2_position]

    nums[store_position] = opcode == 1 ?
      input_1 + input_2 :
      input_1 * input_2

    index += 4
    opcode = nums[index]
    cant_run = index == nums.length || opcode == 99
  end

  nums[0]
end

puts "Part 1: #{part_1}"