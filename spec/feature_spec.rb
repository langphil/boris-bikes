require './lib/docking_station'

station = DockingStation.new
bike = Bike.new
bike1 = Bike.new
bike1.report_broken
station.dock(bike)
station.dock(bike1)
p station
station.release_bike
p station
