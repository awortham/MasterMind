require_relative 'test_helper'
require 'colorize'

class PrinterTest < Minitest::Test


  def test_out_puts_welcome_message
    printer = Printer.new
    assert_output("\e[0;94;49mWelcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?\e[0m\n") {printer.welcome}
  end

  def test_outputs_sequence
    printer = Printer.new
    assert_output ("I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?\n") {printer.sequence}
  end

  def test_outputs_instructions
    printer = Printer.new
    assert_output ("\nWelcome to MasterMind! Make your guess on the command line and receive back
      a clue as to how close your guess was. Make your next guess and repeat until
      you get a full match!\n\n") {printer.instructions}
  end

  def test_outputs_enter_command
    printer = Printer.new
    assert_output ("Enter your command: \n") {printer.enter_command}
  end

  def test_outputs_good_bye
    printer = Printer.new
    assert_output ("Good bye. Thanks for playing!\n\n") {printer.good_bye}
  end

  def test_outputs_not_valid
    printer = Printer.new
    assert_output ("Not a valid command\n") {printer.not_valid}
  end

  def test_output_thanks
    printer = Printer.new
    assert_output ("Thank you for playing!\n") {printer.thanks}
  end

  def test_output_wrong_number_of_letters
    printer = Printer.new
    assert_output ("Thats crap. input 4 letters. Guess again\n") {printer.wrong_number_of_letters}
  end

  def test_output_more_guesses
    printer = Printer.new
    assert_output ("Make another guess?\n") {printer.more_guesses}
  end

  def test_output_good_guess
    printer = Printer.new
    assert_output ("Good guess\n") {printer.good_guess}
  end
end
