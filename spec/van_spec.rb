require 'van'

describe Van do
  let(:bike) { double(:bike) }
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:receive_bike).with(1).argument }

  it 'loads a bike' do
    van_bikes = subject.receive_bike(bike)
    expect(subject.receive_bike(bike)).to eq van_bikes
  end

  describe '#van_dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.receive_bike bike }
      expect { subject.receive_bike bike }.to raise_error 'Van docking at capacity'
    end
  end

  describe '#release_bike' do
    it 'doesnt give out a bike if there are none' do
      expect { subject.release_bike }.to raise_error 'Van has no bikes to release'
    end
  end

end
