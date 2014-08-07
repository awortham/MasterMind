require_relative 'test_helper'

class GameTest < Minitest::Test

  def test_start_creates_a_timestamp
    time = TimeKeeper.new
    assert_equal Fixnum, time.start.class
  end

  def test_finish_creates_another_timestamp
    time = TimeKeeper.new
    assert_equal Fixnum, time.finish.class
  end

  def test_it_computes_a_total_based_on_the_two_timestamps
    time = TimeKeeper.new
    time.start
    time.finish
    assert_equal "#{minutes} minutes, #{seconds} seconds", time.duration
  end
end
