#builds relationship between customer and waiter 
#Meal class - joining model between Waiter & Customer classes, 
class Meal
  attr_accessor :waiter, :customer, :total, :tip #here -- because we're obeying the single source of truth, we're going to tell the Meal class to know all the details of each meal instance. That includes not only the total cost and the tip (which defaults to 0) but also who the customer and waiter were for each meal
 
  @@all = []
 
  def initialize(waiter, customer, total, tip=0) #and here
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
 
  def self.all
    @@all
  end
end