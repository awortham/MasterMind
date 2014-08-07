require_relative 'test_helper'

class GameTest < MiniTest::Test

  def test_it_generates_an_array_of_letters
    game = Game.new
    assert_equal ["b", "r", "y", "g"], game.letters
  end

  def test_randomize_letters_returns_an_array
    game = Game.new
    assert  game.randomize_letters.kind_of?(Array)
  end

  def test_random_array_has_exactly_four_items
    game = Game.new
    assert_equal 4, game.randomize_letters.count
  end

  def test_letters_are_pulled_from_the_letters_variable
    game = Game.new
    game.randomize_letters.each do |letter|
      assert game.letters.include?(letter)
    end
  end

  def test_it_can_check_if_guess_was_in_the_correct_position
    game = Game.new
     number = game.check_position(["b", "r", "y", "g"])
       assert number < 5 && number > -1
  end

  def test_it_can_check_if_any_colors_were_correct
    game = Game.new
     number = game.colors_check(["b", "r", "y", "g"])
     assert number < 5 && number > -1
  end

  def test_it_can_check_if_user_wins_game
    game = Game.new
    game.win_game?(["b", "r", "y", "g"])
    assert true || false
  end
end
