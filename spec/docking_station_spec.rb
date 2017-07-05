require 'docking_station'
describe DockingStation do
  subject { DockingStation.new }
  let(:bike) { Bike.new }

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock).with(1).argument }

  # Check for a 'Raise error' if there are no bikes in the @bikes array
  describe '#release_bike' do
    it 'doesnt give out a bike if there are none' do
      expect { subject.release_bike }.to raise_error 'Docking station has no bikes to release'
    end

    it 'doesnt release a broken bike' do
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.report_broken
      subject.dock bike1
      subject.dock bike2
      expect(subject.release_bike).to eq bike2
    end
  end

  # Check for a 'Raise error' if the @bikes array has more than 20 bikes
  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error 'Docking station at capacity'
    end
  end
end
