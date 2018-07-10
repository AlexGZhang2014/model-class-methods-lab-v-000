class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    includes(boats: :classifications).where(:classifications => {:name => "Catamaran"})
  end
  
  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"})
  end
  
  def self.talented_seafarers
    includes(boats: :classifications).where(classifications: {name: "Motorboat"}, {name: "Sailboat"})
  end
  
  
end

describe Captain do

  describe "::non_sailors" do
    it "returns people who are not captains of sailboats" do
      captains = ["William Kyd", "Arel English", "Henry Hudson"]
      expect(Captain.non_sailors.pluck(:name)).to eq(captains)
    end
  end
end
