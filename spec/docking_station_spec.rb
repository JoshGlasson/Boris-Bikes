require 'boris_bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike) }

  it {subject.release_bike is_expected.to respond_to(:working?) }

end
