require_relative 'game'
require_relative 'commands'
require_relative 'count'


loop do
  c = Commands.new
  c.welcome

  answer = gets.chomp
  case answer
  when "p"
    mastermind = Game.new
    mastermind.randomize
    c.sequence
    intake = gets.chomp
    guess = intake.split('')
    mastermind.make_guess_beginner(guess)
    puts "you have #{mastermind.color(guess)} correct colors."
    puts "you have #{mastermind.position(guess)} correct positions."
  when "i"
     c.instructions
  when "q"
    break
  end
end
