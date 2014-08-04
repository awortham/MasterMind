class Commands
  def welcome
    puts "Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def sequence
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def guess
    "'RRGB' has 3 of the correct elements with 2 in the correct positions
    You've taken 1 guess"
  end

  def congrats
    "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
    22 seconds.
    Do you want to (p)lay again or (q)uit?"
  end

  def instructions
    puts  "\nWelcome to MasterMind! Make your guess on the command line and receive back
      a clue as to how close your guess was. Make your next guess and see how fast
      you can get a full match!\n\n"
  end
end
