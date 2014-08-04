require_relative 'prints'  # => true, false
require_relative 'cli'     # => false, true

class Game
  attr_reader   :letters, :position, :color, :guess, :cli  # => nil, nil
  attr_accessor :count_guesses, :random                    # => nil, nil
  def initialize(cli)
    @letters = ["b", "r", "y", "g"]                        # => ["b", "r", "y", "g"], ["b", "r", "y", "g"]
    @random  = []                                          # => [], []
    @count_guesses = 0                                     # => 0, 0
    @position = position                                   # => nil, nil
    @color = color                                         # => nil, nil
    @guess = guess                                         # => nil, nil
    @cli = cli                                             # => nil, nil
  end

  def randomize
    4.times do
      random = letters.sample
      @random << random
    end
  end

  def guess_logic(guess)
    @guess = guess

    color = colors_check(guess)
    position = check_position(guess)
    @count_guesses += 1
    interprete
    if win_game? == true
      you_won
    else
      cli.subsequent_guess
    end
  end

  def you_won
    puts Prints.congrats(count_guesses, random)
    @count_guesses = 0
    answer = gets.chomp
    case answer
    when "p"
      @random = []
      randomize
      cli.initial_play
    when "q"
      exit
    end
  end

  def interprete
    puts Prints.guess(@count_guesses, color, position, @guess)
  end

  def check_position(guess)
    @position = random.zip(guess).map { |num| num
    }.map { |x| x.uniq.count == 1 }.count(true)
  end

  def colors_check(guess)
    @color = guess.find_all { |color| random.include?(color) }.uniq.count
  end

  def win_game?
    @position == 4
  end
end




#game = Game.new  # => #<Game:0x007f9aae0585e8 @letters=["b", "r", "y", "g"], @random=[], @count_guesses=0, @position=nil, @color=nil, @guess=nil>, #<Game:0x007f9aae052b70 @letters=["b", "r", "y", "g"], @random=[], ...
# game.randomize                          # => 4, 4
# game.random                             # => ["y", "r", "b", "g"], ["b", "g", "g", "r"]
# game.check_position(["g","g","g","g"])  # => 1, 2
# game.colors_check(["g","g","g","g"])    # => 1, 1
