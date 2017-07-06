require 'van'

describe Van do
  let(:bike) { double(:bike) }
  it { is_expected.to respond_to(:van_release_bike) }
  it { is_expected.to respond_to(:van_dock).with(1).argument }

  it 'loads a bike' do
    van_bikes = subject.van_dock(bike)
    expect(subject.van_dock(bike)).to eq van_bikes
  end

  describe '#van_dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.van_dock bike }
      expect { subject.van_dock bike }.to raise_error 'Van docking at capacity'
    end
  end

  describe '#release_bike' do
    it 'doesnt give out a bike if there are none' do
      expect { subject.van_release_bike }.to raise_error 'Van has no bikes to release'
    end
  end

end
