require 'boris_bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike) }
  it 'release bike' do
    expect(subject.release_bike).to respond_to(:working?)
  end
  it {is_expected.to respond_to(:dock_bike)}
end
