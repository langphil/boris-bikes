require 'docking_station'
describe DockingStation do
  subject { DockingStation.new }

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'releases working bikes' do
    bike = double(:bike, broken?: false)
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

  it 'doesnt release a broken bike' do
    bike = double(:bike, broken?: true)
    subject.dock bike
    expect { subject.release_bike }.to raise_error 'Docking station cannot release: bike broken'
  end

  it 'sends a bike for repair if broken' do
    bike = double(:bike, broken?: true)
    subject.dock bike
    expect { subject.release_bike }.to be van(bike)
  end

  describe '#release_bike' do
    it 'doesnt give out a bike if there are none' do
      expect { subject.release_bike }.to raise_error 'Docking station has no bikes to release'
    end
  end

  # Check for a 'Raise error' if the @bikes array has more than 20 bikes
  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock(double :bike) }.to raise_error 'Docking station at capacity'
    end
  end
end
