require_relative 'journey'

class JourneyLog

  def initialize(journey_class=Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journey_class.new(station)
  end

end