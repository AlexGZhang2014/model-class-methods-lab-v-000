class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end
  
  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end
  
  def self.motorboat_operators
    includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  end
  
  def self.talented_seafarers
    self.sailors && self.motorboat_operators
  end
  
  def self.non_sailors
    includes(boats: :classifications).where.not(classifications: {name: "Sailboat"})
  end
end