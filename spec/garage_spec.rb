require 'garage'

describe Garage do
  let(:bike) { double(:bike) }

  it { is_expected.to respond_to(:receive_bike).with(1).argument }
  it { is_expected.to respond_to(:release_bike) }

  describe '#garage_receive_bike' do
    it 'raises an error when full' do
      subject.capacity.times { subject.receive_bike bike }
      expect { subject.receive_bike bike }.to raise_error 'Garage is at capacity'
    end
  end

  describe '#garage_return_bike' do
    it 'doesnt give out a bike if there are none' do
      expect { subject.release_bike }.to raise_error 'Garage has no bikes to return'
    end
  end

end
