require './lib/docking_station'

station = DockingStation.new
bike = Bike.new
van = Van.new
garage = Garage.new
garage.receive_bike(bike)
p garage
garage.release_bike
p garage
