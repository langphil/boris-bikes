require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'Docking station has no bikes to release' if empty?
    bikes.rotate! if bikes[0].broken?
    fail 'Docking station cannot release: bike broken' if bikes[0].broken?
    @bikes.shift
  end

  def receive_bike(bike)
    fail 'Docking station at capacity' if full?
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
