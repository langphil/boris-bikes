require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bike)}

  describe '#release_bike' do
    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    it "doesn't raise the error when we have a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#dock' do
    it "raises an error when full" do
      subject.dock_bike(Bike.new)
      expect { subject.dock_bike Bike.new }.to raise_error "Docking station at capacity!"
    end

    it 'docks a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bike).to eq bike
    end
  end
end
