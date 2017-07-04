require './lib/docking_station'

station = DockingStation.new
#bike = station.release

bike = Bike.new
station.dock_bike(bike)
p station

bike = station.release_bike
p station
