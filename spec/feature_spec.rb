require './lib/docking_station'

station = DockingStation.new
bike = Bike.new
p bike

p 'Adding 20 bikes to the Docking Station'
20.times { station.dock(bike) }
p station

p 'Removing 20 bikes from the station'
20.times { station.release_bike }
p station
