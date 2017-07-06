require './lib/docking_station'

station = DockingStation.new
bike = Bike.new
van = Van.new
garage = Garage.new
bike.report_broken
p bike
station.receive_bike(bike)
p station
van.receive_bike(bike)
p van
garage.receive_bike(bike)
p garage
bike.fix_bike
p bike
van.receive_bike(bike)
p garage
p van
station.receive_bike(bike)
p station
station.release_bike
p station
p bike
