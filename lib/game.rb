require_relative 'prints'
require_relative 'cli'

# guideline:
#   * Dependencies point downwards
#     (in this case, CLI commands Game, but Game doesn't get to command CLI)
#   * Avoid side effects
#     (e.g. if guess is correct, then return true, but don't kick off new game)
#     (e.g. make a new game instead of resetting current game)

class Game
  attr_reader   :letters, :color, :cli
  attr_accessor :count_guesses, :random
  def initialize(cli)
    @letters = ["b", "r", "y", "g"]
    @random  = randomize_letters
    @count_guesses = 0
    @color = color
    @cli = cli
  end

  def randomize_letters
    4.times.map do
      letters.sample
    end
  end

  def guess(guess)
    color = colors_check(guess)
    position = check_position(guess)
    @count_guesses += 1
    interpret(position, guess)
    win_game?(position)
  end

  def you_won(duration_string)
    puts Prints.congrats(count_guesses, random, duration_string)
    @count_guesses = 0
    answer = gets.chomp
    case answer
    when "p"
      @random = randomize_letters
      cli.initial_play
    when "q"
      exit
    end
  end

  def interpret(position, guess)
    puts Prints.guess(@count_guesses, color, position, guess)
  end

  def check_position(guess)
    random.zip(guess)
        .map { |num| num }
        .map { |x| x.uniq.count == 1 }
        .count(true)
  end

  def colors_check(guess)
    @color = guess.find_all { |color| random.include?(color) }.uniq.count
  end

  def win_game?(position)
    position == 4
  end
end




#game = Game.new  # => #<Game:0x007f9aae0585e8 @letters=["b", "r", "y", "g"], @random=[], @count_guesses=0, @position=nil, @color=nil, @guess=nil>, #<Game:0x007f9aae052b70 @letters=["b", "r", "y", "g"], @random=[], ...
# game.randomize                          # => 4, 4
# game.random                             # => ["y", "r", "b", "g"], ["b", "g", "g", "r"]
# game.check_position(["g","g","g","g"])  # => 1, 2
# game.colors_check(["g","g","g","g"])    # => 1, 1
