require 'model'

class MarsRovers
  
  def self.run
    puts 'Enter the code to move the rover then click Enter twice Please ex:- 
    5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM'

    rovers_with_instructions = Array.new

    map = get_map
    return unless map
    begin
      rover = get_rover
      rovers_with_instructions << [rover, get_rover_instructions] if rover
    end while rover

    for r in rovers_with_instructions
      rover = r.first
      instructions = r.last

      for instruction in instructions.to_s.split('')
        case instruction
        when 'M' then rover.move
        when 'R', 'L' then rover.rotate(instruction == 'L')
        end
      end if instructions

      puts 'ROVER OUT OF MAP BOUNDS' unless rover.in_map?(map.width, map.height)
      puts '%d %d %s' % rover.position
    end
  end

  protected

  def self.get_map
    until (input = gets) && (input =~ /(\d+)\s+(\d+)/)
      return nil if input.to_s.chomp.empty?
      puts "Invalid input"
    end
    Map.new($1.to_i, $2.to_i)
  end

  def self.get_rover
    until (input = gets) && (input =~ /(\d+)\s+(\d+)\s+([NESW])/i)
      return nil if input.to_s.chomp.empty?
      puts "Invalid input"
    end
    Rover.new($1.to_i, $2.to_i, $3.to_s.upcase)
  end


  def self.get_rover_instructions
    until (input = gets) && (input =~ /([RLM]+)/i)
      return nil if input.to_s.chomp.empty?
      puts "Invalid input"
    end
    return $1.to_s.upcase
  end
end
