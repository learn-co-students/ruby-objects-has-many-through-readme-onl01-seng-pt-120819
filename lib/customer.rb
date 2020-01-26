
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

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

end










# terrance = Customer.new("Terrance", 27)
# sam = Customer.new("Sam", 27)
#
# jason = Waiter.new("Jason", 4)
# andrew = Waiter.new("Andrew", 7)
# yomi = Waiter.new("Yomi", 10)
#
# terrance.new_meal(jason, 50, 6)
# terrance.new_meal(andrew, 60, 8)
# terrance.new_meal(yomi, 30, 4)
#
# terrance.waiters
# terrance.waiters.length
# terrance.waiters.last.name
#
# jason.best_tipper
# jason.best_tipper.name
