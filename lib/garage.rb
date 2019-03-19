require 'bike'

class Garage

  attr_reader :bike

  def fix_bikes
    @bike = Bike.new
  end

end
