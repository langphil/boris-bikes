require 'docking_station'
describe DockingStation do
  # Check the the DockingStation class will respond to the following methods
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to :bike }

  # Check for a 'Raise error' if there are no bikes in the @bikes array
  describe '#release_bike' do
    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    # Otherwise check that the 'release_bike' method returns a bike
    it "doesn't raise the error when we have a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  # Check for a 'Raise error' if the @bikes array has more than 20 bikes
  describe '#dock_bike' do
    it "raises an error when full" do
      20.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike Bike.new }.to raise_error "Docking station at capacity!"
    end

    # Otherwise add another bike to the @bikes array
    it 'docks a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bike).to eq @bike
    end
  end
end
