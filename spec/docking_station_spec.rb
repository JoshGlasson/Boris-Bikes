require 'docking_station'

describe DockingStation do
let(:bike) { double(:bike) }
let(:van) { double(:van) }
let(:garage) { double(:garage) }

  it {is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  describe '#release_bike' do

    it 'releases working bikes' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it "doesn't release broken bikes" do
      bike = double(:bike)
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end

    it 'docks something' do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike) }
      expect{ docking_station.dock double(:bike) }.to raise_error 'Docking station full'
    end

    subject { DockingStation.new }
    let(:bike) { double(:bike)}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'accepts return of fixed bikes' do
      bike = []
      bike << Bike.new
      subject.accept_fixed_bikes(bike)
      expect(subject.bikes.map {|bike| bike.working?}).to eq [true]
    end
  end

end
