require_relative "bike"

class Garage

  attr_reader :fixed_bikes

  def initialize
    @fixed_bikes = []
  end

  def fix_bikes(broken_bikes)
    broken_bikes.each do |bike|
      bike.fix
      fixed_bikes << bike
    end
    return fixed_bikes
  end

end
