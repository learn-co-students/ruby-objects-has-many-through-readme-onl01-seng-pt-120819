class Waiter
 attr_accessor :name, :yrs_experience
  @@all = []
  
  def initialize (name, yrs_experience)
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
end