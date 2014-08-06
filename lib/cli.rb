require_relative 'time_keeper'
require_relative 'game'
require_relative 'prints'

class CommandLineInterface
  include Prints
  attr_reader :game, :time_keeper, :command, :guess

  def initialize
    @game        = Game.new
    @time_keeper = TimeKeeper.new
    @command     = ""
    @guess       = ""
  end

  def start
    until quit?(@command)
      Prints.welcome
      Prints.enter_command
      @command = get_input
      process_initial_commands
    end
  end

  def process_initial_commands
    case
    when play?
      initial_play
    when instructions?
       Prints.instructions
      start
    when quit?(@command)
      Prints.good_bye
    else
      Prints.not_valid
      start
    end
  end

  def initial_play
    time_keeper.start
    puts Prints.sequence
    take_guess
  end

  def take_guess
    until win? || quit?(@guess)
      Prints.enter_command
      @guess = get_input
      case
      when quit?(@guess)
        Prints.good_bye
      when invalid_guess?(@guess)
        Prints.wrong_number_of_letters
      else
        guess = @guess.split('')
        @did_i_win = @game.guess(guess)
        determine_if_winner
      end
    end
  end

  def subsequent_guess
    Prints.more_guesses
    take_guess
  end

  def determine_if_winner
    if @did_i_win
      time_keeper.finish
      you_won(time_keeper.duration)

    else
      subsequent_guess
    end
  end

  def you_won(duration_string)
    Prints.congrats(@game.count_guesses, @game.random, duration_string)
    answer = get_input
    if answer == 'q'
    Prints.thanks
    else
    reset
    end
  end

  def reset
    @game.count_guesses = 0
    @game.randomize_letters
    @did_i_win = false
    @guess = ''
    start
  end

  def get_input
    gets.downcase.strip
  end

  def play?
    command == "p"
  end

  def instructions?
    command == 'i'
  end

  def quit?(guess)
    guess == "q" || guess == 'quit'
  end

  def invalid_guess?(command)
    command.length != 4
  end

  def validate_guess(guess)
   if invalid_guess(guess) == true
     take_guess
   else
     Prints.good_guess
   end
  end

  def win?
    @did_i_win
  end
end
