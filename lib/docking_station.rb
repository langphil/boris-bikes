require_relative 'bike'

class DockingStation
  attr_reader :bike

  def dock_bike(bike)
    fail 'Docking station at capacity!' if @bike
    @bike = bike
  end

  def release_bike
    fail "bike not present" unless @bike
    @bike
  end

end
