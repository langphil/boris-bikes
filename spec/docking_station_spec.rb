require 'docking_station'

describe DockingStation do
  subject { DockingStation.new }

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:receive_bike).with(1).argument }

  it 'releases working bikes' do
    bike = double(:bike, broken?: false)
    subject.receive_bike bike
    expect(subject.release_bike).to be bike
  end

  it 'doesnt release a broken bike' do
    bike = double(:bike, broken?: true)
    subject.receive_bike bike
    expect { subject.release_bike }.to raise_error 'Docking station cannot release: bike broken'
  end

  describe '#release_bike' do
    it 'doesnt give out a bike if there are none' do
      expect { subject.release_bike }.to raise_error 'Docking station has no bikes to release'
    end
  end

  # Check for a 'Raise error' if the @bikes array has more than 20 bikes
  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.receive_bike double :bike }
      expect { subject.receive_bike(double :bike) }.to raise_error 'Docking station at capacity'
    end
  end
end
