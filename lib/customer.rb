#has many waiters through meals
class Customer
  attr_accessor :name, :age
 
  @@all = []
 
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip=0) #grants the/a customer the ability to create a new meal. it automatically associates each new meal with the customer that created it. 
    Meal.new(waiter, self, total, tip) #same
  end
  
  def meals #the customer is going to look at all of the meals, and then select only the ones that belong to them, if they know the name of the waiter of their last meal so they can leave them a good review. 
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
  
  def waiters #So rachel.meals will return an array of all of Rachel's meals, but what if we now want a list of all of the waiters that Rachel has interacted with? Each meal is also associated with a waiter, so to get every waiter from every meal Rachel has had, we need to take the array of all of Rachel's meals, map over it, getting the waiter from each of those meals.
    meals.map do |meal|
      meal.waiter
    end
  end
  
  def new_meal(waiter, total, tip=0) #?
    Meal.new(waiter, self, total, tip)
  end
 
  def new_meal_20_percent(waiter, total) #?
    tip = total * 0.2
    Meal.new(waiter, self, total, tip)
  end
 
  def self.oldest_customer #?
    oldest_age = 0
    oldest_customer = nil
    self.all.each do |customer|
      if customer.age > oldest_age
        oldest_age = customer.age
        oldest_customer = customer
      end
    end
    oldest_customer
  end

end