require 'set'

def get_coords(path)
  current_x = 0
  current_y = 0
  coords = []
  
  path.split(",").each { |movement|
    direction = movement[0]
    distance = movement[1..-1].to_i
  
    distance.times do
      case direction
        when "R"
          current_x += 1
        when "D"
          current_y -= 1
        when "L"
          current_x -= 1
        when "U"
          current_y += 1
      end
  
      coords << [current_x, current_y]
    end
  }

  coords
end

def get_intersections(coords_1, coords_2)
  longer = nil
  shorter = nil

  if coords_1.length > coords_2.length
    longer = Set.new(coords_1)
    shorter = Set.new(coords_2)
  else
    longer = Set.new(coords_2)
    shorter = Set.new(coords_1)
  end
    
  intersections = Set.new()
  shorter.each { |coord|
    intersections.add(coord) if longer.include? coord
  }

  intersections
end

def part_1
  @intersections.map { |intersection|
    intersection[0].abs + intersection[1].abs
  }.min
end

def part_2
  @intersections.map { |intersection|
    @coords_1.index(intersection) + @coords_2.index(intersection) + 2
  }.min
end

File.open("input.txt") { |f|
  @input_path_1 = f.readline
  @input_path_2 = f.readline
}

@coords_1 = get_coords(@input_path_1)
@coords_2 = get_coords(@input_path_2)

@intersections = get_intersections(@coords_1, @coords_2)

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"