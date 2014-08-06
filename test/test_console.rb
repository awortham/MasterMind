class ConsoleOutput

  def welcome
    puts "welcome"
  end

  private  # => ConsoleOutput

  def puts(message)
    ENVIRONMENT ? message : super
  end

end
