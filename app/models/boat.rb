class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications
  
  def self.first_five
    all.limit(5)
  end
  
  def self.dinghy
    where("length < ?", 20)
  end
  
  def self.ship
    where("length >= ?", 20)
  end
  
  def self.last_three_alphabetically
    all.limit(4)
    #order(:name).last(3)
    #order(:name).reverse.last(3)
  end
  
  def self.without_a_captain
    where(captain: nil)
  end
  
  def self.sailboats
    includes(:classifications).where(:classifications => {:name => "Sailboat"})
  end
  
  def self.with_three_classifications
    where("classifications_size = ?", 3)
  end
end
