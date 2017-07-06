class Van

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def van_release_bike
    fail 'Van has no bikes to release' if empty?
    @bikes.shift
  end

  def van_dock(bike)
    fail 'Van docking at capacity' if full?
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
