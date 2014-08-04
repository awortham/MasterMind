class Count
  attr_reader :first, :second

  def initialize
    @first = first
    @second = second
  end

  def start_time
    @first = Time.now.to_i
  end

  def end_time
    @second = Time.now.to_i
  end

  def duration(first, second)
    seconds = ((first - second) % 60)
    minutes = (first - second) / 60
  end
end
