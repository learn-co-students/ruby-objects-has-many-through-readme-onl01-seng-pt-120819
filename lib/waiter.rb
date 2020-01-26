

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

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
    # Notice that the parameters are different for the new_meal method are different for customer and waiter, but the order of arguments for Meal.new() remains the same - a waiter, a customer, a total and a tip
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end


end





# pat = Waiter.new("Pat", 2)
# alex = Waiter.new("Alex", 5)
#
#
# sam.new_meal(pat, 50, 10)
# sam.new_meal(alex, 20, 3)
# pat.new_meal(sam, 30, 5)
#
#
# rachel.meals
# rachel.meals.length
# Meals.all.length
