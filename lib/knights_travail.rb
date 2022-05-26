# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'

# a knight's journey from one square on the board to the other in the shortest number of moves
class KnightsTravail
  def initialize
    @knight = Knight.new
    @board = Board.new(@knight.start_coord)
  end

  def play
    path = @board.find_path(@knight.end_coord)
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each { |coord| puts coord }
  end
end
