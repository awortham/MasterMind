class TimeKeeper
  def start
    @start_time = Time.now.to_i
  end

  def finish
    @end_time = Time.now.to_i
  end

  def duration
    seconds = ((@end_time - @start_time) % 60)
    minutes = (@end_time - @start_time) / 60
    "#{minutes} minutes, #{seconds} seconds"
  end
end
