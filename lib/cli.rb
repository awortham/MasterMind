require_relative 'time_keeper'
require_relative 'game'
require_relative 'prints'

class CommandLineInterface
  include Prints
  attr_reader :game

  def initialize
    @game = Game.new(self)
    @timekeeper = TimeKeeper.new
  end

  def start
    puts Prints.welcome
    choice = gets.chomp
    determine_game(choice)
  end

  def determine_game(choice)
    case choice
    when "p"
      initial_play
    when "i"
      puts Prints.instructions
      start
    when "q"
      exit
    end
  end

  def initial_play
    puts Prints.sequence
    intake = gets.chomp
    guess = intake.split('')
    @game.guess(guess)
  end

  def subsequent_guess
    puts "Make another guess?"
    intake = gets.chomp
    guess = intake.split('')
    @game.guess(guess)
  end
end


#run colors_check(guess)
#run position_check(guess)
#raise the count_guesses by 1
#capture the user's guess in a variable so that you can retrieve the information
