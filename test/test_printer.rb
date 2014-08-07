require_relative 'test_helper'

ENVIRONMENT = "test"

class GameTest < Minitest::Test


  def test_out_puts_welcome_message
    printer = Printer.new

    assert_equal "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?", printer.welcome
  end

  def test_outputs_sequence
    printer = Printer.new

    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?", printer.sequence
  end

  def test_outputs_instructions
    printer = Printer.new
    assert_equal "\nWelcome to MasterMind! Make your guess on the command line and receive back
      a clue as to how close your guess was. Make your next guess and repeat until
      you get a full match!\n\n", printer.instructions
  end

  def test_outputs_enter_command
    printer = Printer.new
    assert_equal "Enter your command: ", printer.enter_command
  end

  def test_outputs_good_bye
    printer = Printer.new
    assert_equal "Good bye. Thanks for playing!\n\n", printer.good_bye
  end

  def test_outputs_not_valid
    printer = Printer.new
    assert_equal "Not a valid command", printer.not_valid
  end

  def test_output_thanks
    printer = Printer.new
    assert_equal "Thank you for playing!", printer.thanks
  end

  def test_output_wrong_number_of_letters
    printer = Printer.new
    assert_equal "Thats crap. input 4 letters. Guess again", printer.wrong_number_of_letters
  end

  def test_output_more_guesses
    printer = Printer.new
    assert_equal "Make another guess?", printer.more_guesses
  end

  def test_output_good_guess
    printer = Printer.new
    assert_equal "Good guess", printer.good_guess
  end
end
