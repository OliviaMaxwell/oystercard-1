class Journey
  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(station=nil)
    @entry_station = station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    complete? == true ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    if @entry_station && @exit_station
      true
    else
      false
    end
  end
end