require 'vans'

describe Vans do

  it { is_expected.to respond_to(:collect_broken_bikes) }

  it { is_expected.to respond_to(:distributes_working_bikes) }

  it 'collects bike and makes sure it is broken' do
    subject.collect_broken_bikes
    expect(subject.bike.working?).to eq false
  end

  it "distributes_working_bikes that are working" do
    subject.distributes_working_bikes
    expect(subject.bike.working?).to eq true
  end

  it "collects broken bikes from docking station" do
    ds = DockingStation.new
    bike = Bike.new
    bike.report_broken
    ds.dock(bike)
    subject.collect_broken_bikes
    is_each_bike_working = subject.broken_bikes.map { |bike| bike.working? }
    expect(is_each_bike_working).not_to include true
  end


end
