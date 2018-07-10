class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications
  
  def self.my_all
    all.uniq
  end

  def longest
    includes(:boats).group("length").last
  end
end
