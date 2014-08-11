class CLI
  attr_reader :game,
              :time_keeper,
              :printer,
              :command,
              :guess,
              :did_i_win

  def initialize
    @game        = Game.new
    @time_keeper = TimeKeeper.new
    @printer     = Printer.new
    @command     = ""
    @guess       = ""
    @did_i_win   = false
  end

  def start
    until quit?(command)
      printer.welcome
      printer.enter_command
      @command = get_input
      process_initial_commands
    end
  end

  def process_initial_commands
    case
    when play?
      initial_play
    when instructions?
      printer.instructions
      start
    when quit?(command)
      printer.good_bye
    else
      printer.not_valid
      start
    end
  end

  def initial_play
    time_keeper.start
    printer.sequence
    take_guess
  end

  def take_guess
    until win? || quit?(guess)
      printer.enter_command
      @guess = get_input
      case
      when quit?(guess)
        printer.good_bye
      when invalid_guess?(guess)
        printer.wrong_number_of_letters
      else
        @guess     = guess.split('')
        @did_i_win = game.guess(guess)
        determine_if_winner
      end
    end
  end

  def subsequent_guess
    printer.more_guesses
    take_guess
  end

  def determine_if_winner
    if did_i_win
      time_keeper.finish
      you_won(time_keeper.duration)
    else
      subsequent_guess
    end
  end

  def you_won(duration_string)
    printer.congrats(game.count_guesses, game.random, duration_string)
    answer = get_input
    if answer == 'q'
      printer.thanks
    else
      reset
    end
  end

  def reset
    #@game.count_guesses = 0
    @game = Game.new
    @did_i_win = false
    @guess     = nil
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
      printer.good_guess
    end
  end

  def win?
    did_i_win
  end
end
