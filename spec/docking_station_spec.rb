require 'docking_station'
describe DockingStation do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  
  # Check the the DockingStation class will respond to the following methods
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock).with(1).argument }

  # Initialization
  describe 'Initialization' do
    it 'default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station at capacity!'
    end
  end

  # Check for a 'Raise error' if there are no bikes in the @bikes array
  describe '#release_bike' do
    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    # Otherwise check that the 'release_bike' method returns a bike
    it "doesn't raise the error when we have a bike" do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "doesn't release a broken bike" do
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.report_broken
      subject.dock bike1
      subject.dock bike2
      expect(subject.release_bike).to eq bike2
    end
  end

  # Otherwise add another bike to the @bikes array
  it 'docks a bike' do
    bikes = subject.dock bike
    expect(subject.dock bike).to eq bikes
  end

  # Check for a 'Raise error' if the @bikes array has more than 20 bikes
  describe '#dock' do
    it "raises an error when full" do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error "Docking station at capacity!"
    end
  end
end
