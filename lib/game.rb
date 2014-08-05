require_relative 'cli'     # => false, true
require_relative 'prints'

# guideline:
#   * Dependencies point downwards
#     (in this case, CLI commands Game, but Game doesn't get to command CLI)
#   * Avoid side effects
#     (e.g. if guess is correct, then return true, but don't kick off new game)
#     (e.g. make a new game instead of resetting current game)

class Game

  include Prints

  attr_reader   :letters, :cli
  attr_accessor :count_guesses, :random
  def initialize(cli)
    @letters = ["b", "r", "y", "g"]
    @random  = randomize_letters
    @count_guesses = 0
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
    answer = gets.downcase.chomp
    case answer
    when "p"
      @random = randomize_letters
      cli.initial_play
    when "q"
      exit
    end
  end

  def interpret(position, guess)
    color = colors_check(guess)
    puts Prints.guess(@count_guesses, color, position, guess)
  end

  def check_position(guess)
    random.zip(guess)
        .map { |num| num }
        .map { |x| x.uniq.count == 1 }
        .count(true)
  end

  def colors_check(guess)

    doubles = random.zip(guess) .select do |nested|
      nested[0] != nested[1]
    end
    a, b = doubles.transpose
    a.map do |same|
    b.join.include?(same)

    end.count(true)
  end

  def win_game?(position)
    position == 4
  end
end




# game = Game.new
# game.random
# game.check_position(["g","g","g","g"])
# game.colors_check(["g","r","r","y"])
