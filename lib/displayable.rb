# frozen_string_literal: true

require_relative 'constants'

# methods that print to the console
module Displayable
  def user_input_coord(type, axis)
    puts "Please enter the #{type} #{axis}-coordinate for the knight (a digit from 0 to #{Constants::DIMENSION - 1}):"
    user_input = gets.chomp
    return user_input.to_i if user_input.to_i.to_s == user_input && user_input.to_i.between?(0, Constants::DIMENSION - 1)

    puts 'Invalid input.'
    user_input_coord(type, axis)
  end
end
