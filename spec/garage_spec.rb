require 'garage'

describe Garage do

  it { is_expected.to respond_to(:fix_bikes) }

  it "fixes bikes when fix bikes is used" do
    ds = DockingStation.new
    bike = Bike.new
    van = Van.new
    bike.report_broken
    ds.dock(bike)
    van.collect_broken_bikes(ds.bikes)
    subject.fix_bikes(van.broken_bikes)
    expect(subject.fixed_bikes.map {|bike| bike.working?}).to eq [true]
  end

end
