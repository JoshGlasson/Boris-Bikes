require 'vans'

describe Van do

  it { is_expected.to respond_to(:collect_broken_bikes) }

  it { is_expected.to respond_to(:distributes_working_bikes) }

  it "distributes_working_bikes that are working" do
    bikes = []
    bikes << Bike.new
    subject.distributes_working_bikes(bikes)
    expect(subject.bikes_to_deliver.map { |bike| bike.working?}).to eq [true]
  end

  it "collects broken bikes from docking station" do
    ds = DockingStation.new
    bike = Bike.new
    bike.report_broken
    ds.dock(bike)
    subject.collect_broken_bikes(ds.bikes)
    expect(subject.broken_bikes).not_to include false
  end


end
