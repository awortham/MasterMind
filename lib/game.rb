class Game
  attr_reader   :letters,
                :cli,
                :random,
                :printer
  attr_accessor :count_guesses

  def initialize
    @letters       = ["b", "r", "y", "g"]
    @random        = randomize_letters
    @count_guesses = 0
    @level         = 0
    @printer       = Printer.new
  end

  def randomize_letters
    4.times.map {letters.sample}
  end

  def guess(guess)
    color = colors_check(guess)
    position = check_position(guess)
    @count_guesses += 1
    interpret(position, guess)
    win_game?(position)
  end

  def interpret(position, guess)
    color = colors_check(guess)
    printer.guess(@count_guesses, color, position, guess)
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
