require_relative 'test_helper'
require_relative '../lib/test_console'

ENVIRONMENT = "test"

class TestConsoleOutput < Minitest::Test

  def test_it_welcomes_user
    console = ConsoleOutput.new
    assert_equal "welcome", console.welcome
  end
end
