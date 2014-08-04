class Game
  attr_reader   :letters
  attr_accessor :random, :count_guesses

  def initialize
    @letters = ["b", "r", "y", "g"]
    @random  = []
    @count_guesses = 0
  end

  def randomize
    4.times  do
      random = letters.sample
      @random << random
    end
  end

  def make_guess_beginner(l1)
    @count_guesses += 1
    guess = l1
    position(guess)
    color(guess)
  end

  def position(guess)
    random.zip(guess).map { |num| num
    }.map { |x| x.uniq.count == 1 }.count(true)
  end

  def color(guess)
    color = guess.find_all { |color| random.include?(color) }.uniq.count
  end

  def stats
  end
end


game = Game.new
game.randomize
game.make_guess_beginner(["g","g","g","g"])
