class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications
  
  def self.my_all
    all.uniq
  end

  describe "#longest" do
    it "returns the classifications for the longest boat" do
      classifications = ["Motorboat", "Center Console"]
      expect(Classification.longest.pluck(:name)).to eq(classifications)
    end
  end
end
