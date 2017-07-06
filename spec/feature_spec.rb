require './lib/docking_station'

station = DockingStation.new
bike = Bike.new
van = Van.new
bike.report_broken
station.dock(bike)
p station
p van
van.van_dock(bike)
p van
