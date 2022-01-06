require 'journey'

describe Journey do
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }

  it "is an incomplete journey by default" do
    expect(subject).not_to be_complete
  end

  it "initializes with an entry station" do
    journey = Journey.new(entry_station)
    expect(journey.entry_station).to eq entry_station
  end

  it "saves an exit station" do
    journey = Journey.new(entry_station)
    journey.finish(exit_station)
    expect(journey.exit_station).to eq exit_station
  end

  describe "#fare" do
    let(:min_fare) {Journey::MINIMUM_FARE}
    let(:pen_fare) {Journey::PENALTY_FARE}

    it "returns the penalty fare if they only touch in" do
      journey = Journey.new(entry_station)
      expect(journey.fare).to eq pen_fare
    end

    it "returns the penalty fare if the only touch out" do
      journey = Journey.new
      journey.finish(exit_station)
      expect(journey.fare).to eq pen_fare
    end

    it "returns the minimum fare if the complete a journey" do
      journey = Journey.new(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq min_fare
    end
  end
end





