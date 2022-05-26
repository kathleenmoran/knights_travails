# frozen_string_literal: true
require_relative 'constants'

# a coordinate on a chess board
class Coordinate
  attr_reader :x, :y

  def initialize(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    (@x * 100 + @y).hash
  end

  def valid?
    @x.between?(0, Constants::DIMENSION - 1) && @y.between?(0, Constants::DIMENSION - 1)
  end

  def nearby_coordinate(x_increment, y_increment)
    Coordinate.new(@x + x_increment, @y + y_increment)
  end

  def valid_knight_move_coords
    coordinate_permutations = [-2, -1, 1, 2].permutation(2).to_a.reject { |perm| perm[0].abs == perm[1].abs }
    coordinate_permutations.map { |perm| nearby_coordinate(perm[0], perm[1]) }.select(&:valid?)
  end

  def to_s
    "[#{@x},#{@y}]"
  end
end
