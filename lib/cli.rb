require_relative 'time_keeper'  # => true
require_relative 'game'         # => true
require_relative 'prints'       # => false

class CommandLineInterface
  include Prints                             # => CommandLineInterface
  attr_reader :game, :time_keeper, :command, :guess  # => nil

  def initialize
    @game        = Game.new(self)
    @time_keeper = TimeKeeper.new
    @command     = ""
    @guess       = ""
  end

  def start
    puts Prints.welcome
    until finished?
      print "Enter your command: "
      @command = get_input
      process_initial_commands
    end
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
      puts "Good bye."
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

  def invalid_guess?(command)
    command.length != 4
  end

 def validate_guess(guess)
   if invalid_guess(guess) == true
     take_guess
   else
     puts "Good guess"
   end
 end


  def take_guess
    puts "Game initialized."
    until win? || quit?
      print "Enter your guess: "
      @guess = get_input
      case
      when quit?
        puts "Thanks for playing."
      when invalid_guess?(command)
        puts "Thats crap. input 4 letters. Guess again"
      else
        guess = command.split('')
        @did_i_win = @game.guess(guess)
        determine_if_winner
      end
    end
  end

  def quit?
    guess == "q"
  end

  def win?
    @did_i_win
  end

  def determine_if_winner
    if @did_i_win
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
    restart
  end

  def restart
    @game.count_guesses = 0
    @game = Game.new(self)
    process_initial_commands
  end
end
