require_relative 'bike'

# DockingStation Class
class DockingStation
  attr_reader :bike

  # Initializing with an empty array
  def initialize
    @bikes = []
  end

  # Fail if there are not bikes in the @bikes array
  # Otherwise 'pop' a bike of the end of the array
  def release_bike
    fail "bike not present" if @bikes.empty?
    @bikes.pop
  end

  # Fail if there are more than 20 bikes in the @bikes array
  # Otherwise, add a bike to the array
  def dock_bike(bike)
    fail 'Docking station at capacity!' if @bikes.count >= 20
    @bikes << bike
  end

end
