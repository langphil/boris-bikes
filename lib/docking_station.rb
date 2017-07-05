require_relative 'bike'

# DockingStation Class
class DockingStation
  attr_accessor :bike, :capacity
  DEFAULT_CAPACITY = 20

  # Initializing with an empty array and capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # Fail if there are not bikes in the @bikes array
  # Otherwise 'pop' a bike of the end of the array
  def release_bike
    fail "bike not present" if empty?
    @bikes.pop
  end

  # Fail if there are more than 20 bikes in the @bikes array
  # Otherwise, add a bike to the array
  def dock(bike)
    fail 'Docking station at capacity!' if full?
    @bikes << bike
  end

  # Defining Private methods
  private
  # Makes the Instance Variable of 'bikes' accessible
  attr_reader :bikes
  # Check if the @bikes array is empty
  def empty?
    @bikes.empty?
  end

  # Check if the @bikes array is greater than or equal to 20
  def full?
    @bikes.count >= capacity
  end

end
