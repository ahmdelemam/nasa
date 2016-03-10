#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../libs'))

require 'test/unit'
require 'model'

class TestRover < Test::Unit::TestCase #:nodoc:
  # Test initialization
  def test_initialization
    rover = Rover.new(1, 2, 'W')
    assert_equal(rover.x, 1)
    assert_equal(rover.y, 2)
    assert_equal(rover.heading, 3)
  end

  def test_movement
    # North
    rover = Rover.new(1, 1, 'N')
    rover.move
    assert_equal(rover.position, [1, 2, 'N'])
    
    # East
    rover = Rover.new(1, 1, 'E')
    rover.move
    assert_equal(rover.position, [2, 1, 'E'])

    # South
    rover = Rover.new(1, 1, 'S')
    rover.move
    assert_equal(rover.position, [1, 0, 'S'])

    # West
    rover = Rover.new(1, 1, 'W')
    rover.move
    assert_equal(rover.position, [0, 1, 'W'])
  end

  def test_rotation
    rover = Rover.new(0, 0, 'N')
    rover.rotate(false)
    assert_equal(rover.position, [0, 0, 'E'])
    
    # rotation in heading bounds
    rover = Rover.new(0, 0, 'N')
    rover.rotate(true)
    assert_equal(rover.position, [0, 0, 'W'])

    rover = Rover.new(0, 0, 'W')
    rover.rotate(false)
    assert_equal(rover.position, [0, 0, 'N'])
  end

  def test_position_reporting
    rover = Rover.new(1, 1, 'W')
    assert_equal(rover.position, [1, 1, 'W'])
  end

  def test_map_inclusion
    rover = Rover.new(2, 2, 'W')
    assert(!rover.in_map?(1, 1))
    assert(rover.in_map?(2, 2))
    assert(rover.in_map?(3, 3))
  end
end
