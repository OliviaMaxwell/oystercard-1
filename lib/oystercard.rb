require_relative "journey"

class Oystercard
  attr_reader :balance, :journey_history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @current_journey = nil
    @journey_history = []
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    deduct(@journey_history[-1].fare) if in_journey? == true
    store_journey(station)
  end

  def touch_out(station)
    @current_journey.finish(station)
    deduct(@current_journey.fare)
    @current_journey = nil
  end

  def in_journey?
   @current_journey != nil
  end

  private
  def store_journey(station)
    @current_journey = Journey.new(station)
    @journey_history << @current_journey
  end

  def deduct(fare)
    @balance -= fare
  end
end