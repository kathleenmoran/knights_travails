# frozen_string_literal: true

require_relative 'coordinate'

# chess board containing all squares in the form of a graph of a knight's moves
class Board
  def initialize(start_coord)
    @start_coord = start_coord
    @unvisited_coords = [start_coord]
    @graph = {}
    generate_graph
  end

  def find_path(coord)
    queue = [[@start_coord]]
    until queue.empty?
      path = queue.shift
      current_coord = path[-1]
      return path if current_coord == coord

      @graph[current_coord].each do |adjacent_coord|
        new_path = (path.dup << adjacent_coord)
        queue << new_path
      end
    end
  end

  private

  def generate_graph
    until @unvisited_coords.empty?
      new_coord = @unvisited_coords.shift
      add_coord(new_coord)
      @unvisited_coords += @graph[new_coord]
    end
  end

  def add_coord(coord)
    return if @graph.key?(coord)

    x = coord.valid_knight_move_coords.reject { |adjacent_coord| @graph.key?(adjacent_coord) }
    @graph[coord] = x
  end
end
