class Printer
  def welcome
     puts "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def sequence
     puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def guess(count_guesses, color, position, guess)
    puts "'#{guess}' has #{color} of the correct elements with #{position} in the correct positions
    You've taken #{count_guesses} guesses"
  end

  def congrats(count_guesses, user_guess, duration_string)
    puts "Congratulations! You guessed the sequence '#{user_guess}' in #{count_guesses} guesses over #{duration_string}.
    Do you want to (p)lay again or (q)uit?"
  end

  def instructions
    puts "\nWelcome to MasterMind! Make your guess on the command line and receive back
      a clue as to how close your guess was. Make your next guess and repeat until
      you get a full match!\n\n"
  end

  def enter_command
    puts "Enter your command: "
  end

  def good_bye
    puts "Good bye. Thanks for playing!\n\n"
  end

  def not_valid
    puts "Not a valid command"
  end

  def thanks
    puts "Thank you for playing!"
  end

  def wrong_number_of_letters
    puts "Thats crap. input 4 letters. Guess again"
  end

  def more_guesses
    puts "Make another guess?"
  end

  def good_guess
    puts "Good guess"
  end
end
