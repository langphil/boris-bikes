require_relative 'bike'

# DockingStation Class
class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20

  # Initializing with an empty array
  def initialize
    @bikes = []
  end

  # Fail if there are not bikes in the @bikes array
  # Otherwise 'pop' a bike of the end of the array
  def release_bike
    fail "bike not present" if empty?
    @bikes.pop
  end

  # Fail if there are more than 20 bikes in the @bikes array
  # Otherwise, add a bike to the array
  def dock_bike(bike)
    fail 'Docking station at capacity!' if full?
    @bikes << bike
  end

  # Defining Private methods
  private
  # Check if the @bikes array is empty
  def empty?
    @bikes.empty?
  end

  # Check if the @bikes array is greater than or equal to 20
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

end
