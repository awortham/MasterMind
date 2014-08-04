module Prints
  extend self

  def welcome
     "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def sequence
     "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def guess(count_guesses, color, position, guess)
    "'#{guess}' has #{color} of the correct elements with #{position} in the correct positions
    You've taken #{count_guesses} guesses"
  end

  def congrats(count_guesses, user_guess)
    "Congratulations! You guessed the sequence '#{user_guess}' in #{count_guesses} guesses over time.
    Do you want to (p)lay again or (q)uit?"
  end

  def instructions
      "\nWelcome to MasterMind! Make your guess on the command line and receive back
      a clue as to how close your guess was. Make your next guess and repeat until
      you get a full match!\n\n"
  end
end
