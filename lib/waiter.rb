class Waiter
  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end
   
  def new_meal(customer, total, tip=0)#grants the/a waiter the ability to create a new meal. it automatically associates each new meal with the waiter that created it. 
    Meal.new(self, customer, total, tip) #same
  end
  
  def meals
    Meal.all.select do |meal|
      meal.waiter == self #waiter checks for all of the meals they have ever served
    end
  end
  
  def best_tipper #finds their best tipper 
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
 
    best_tipped_meal.customer
  end
  
  
end