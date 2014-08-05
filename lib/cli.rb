require_relative 'time_keeper'
require_relative 'game'
require_relative 'prints'

class CommandLineInterface
  include Prints
  attr_reader :game, :time_keeper, :command

  def initialize
    @game = Game.new(self)
    @time_keeper = TimeKeeper.new
    @command = ""
  end

  def start
    puts Prints.welcome
    @command = get_input
    process_initial_commands
  end

  def get_input
    gets.downcase.strip
  end

  def process_initial_commands
    case
    when play?
         initial_play
    when instructions?
        puts Prints.instructions
        start
    when finished?
         exit
    else
         puts "Not a valid command"
         start
    end
  end

  def play?
    command == "p"
  end

  def instructions?
    command == 'i'
  end

  def finished?
    command == 'q' || command == 'quit'
  end

  def initial_play
    time_keeper.start
    puts Prints.sequence
    take_guess
  end

  def subsequent_guess
    puts "Make another guess?"
    take_guess
  end

  def take_guess
    guess    = get_input.split('')
    user_won = @game.guess(guess)
    if user_won
      time_keeper.finish
      @game.you_won(time_keeper.duration)
    else
      subsequent_guess
    end
  end
end


#run colors_check(guess)
#run position_check(guess)
#raise the count_guesses by 1
#capture the user's guess in a variable so that you can retrieve the information
