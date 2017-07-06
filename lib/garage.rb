class Garage

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'Garage has no bikes to return' if empty?
    @bikes.shift
  end

  def receive_bike(bike)
    fail 'Garage is at capacity' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end
