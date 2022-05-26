# frozen_string_literal: true

require_relative 'knights_travail'

def ask_to_play_again
  puts 'Would you like to play again? (Y/N)'
  user_input = gets.chomp.downcase
  if %w[y yes].include?(user_input)
    run
  elsif %w[n no].include?(user_input)
    puts 'Thanks for playing!'
  else
    puts "That's an invalid reponse."
    ask_to_play_again
  end
end

def run
  KnightsTravail.new.play
  ask_to_play_again
end

run
