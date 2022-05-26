# frozen_string_literal: true

require_relative 'displayable'
require_relative 'coordinate'

# knight piece
class Knight
  include Displayable
  attr_reader :start_coord, :end_coord

  def initialize
    x_start = user_input_coord('starting', 'x')
    y_start = user_input_coord('starting', 'y')
    @start_coord = Coordinate.new(x_start, y_start)
    x_end = user_input_coord('ending', :x)
    y_end = user_input_coord('ending', :y)
    @end_coord = Coordinate.new(x_end, y_end)
  end
end
