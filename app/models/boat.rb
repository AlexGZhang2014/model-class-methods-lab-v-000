class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications
  
  def self.first_five
    self.first(5)
  end
  
  def self.dinghy
    
  end
end

describe Boat do

  describe "::dinghy" do
    it "returns boats shorter than 20 feet" do
      boats = ["Nacra 17", "Boston Whaler", "49er", "Laser", "Harpoon 4.7", "Sunfish"]
      expect(Boat.dinghy.pluck(:name)).to eq(boats)
    end
  end

  describe "::ship" do
    it "returns boats 20 feet or longer" do
      boats = ["H 28", "Regulator 34SS", "Zodiac CZ7", "Cape Dory", "Triton 21 TRX", "Sun Tracker Regency 254 XP3"]
      expect(Boat.ship.pluck(:name)).to eq(boats)
    end
  end

  describe "::last_three_alphabetically" do
    it "returns last three boats in alphabetical order" do
      boats = ["Zodiac CZ7", "Triton 21 TRX", "Sunfish"]
      expect(Boat.last_three_alphabetically.pluck(:name)).to eq(boats)
    end
  end

  describe "::without_a_captain" do
    it "returns boats without a captain" do
      boats = ["Harpoon 4.7", "Sunfish"]
      expect(Boat.without_a_captain.pluck(:name)).to eq(boats)
    end
  end

  describe "::sailboats" do
    it "returns all boats that are sailboats" do
      boats = ["H 28", "Nacra 17", "49er", "Laser", "Harpoon 4.7", "Sunfish"]
      expect(Boat.sailboats.pluck(:name)).to eq(boats)
    end
  end

  describe "::with_three_classifications" do
    it "returns boats with three classifications" do
      boats = ["Nacra 17", "Zodiac CZ7", "Sun Tracker Regency 254 XP3"].sort
      expect(Boat.with_three_classifications.pluck(:name).sort).to eq(boats)
    end
  end

end
