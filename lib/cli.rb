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
    unless finished?
    case
    when play?
        initial_play
    when instructions?
        puts Prints.instructions
        start
    else
      puts "Not a valid command"
      start
    end
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
    @command    = get_input
    if finished?
      restart
      return
    end
    guess = command.split('')
    user_won = @game.guess(guess)
    if user_won
      time_keeper.finish
      you_won(time_keeper.duration)
    else
      subsequent_guess
    end
  end

  def restart
    puts "Thank you for playing!"
    start
  end


  def you_won(duration_string)
    Prints.congrats(@game.count_guesses, @game.random, duration_string)
    answer = get_input
    @game.count_guesses = 0
    process_initial_commands
  end
end
