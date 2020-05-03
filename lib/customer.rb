class Customer
  attr_accessor :name, :age
 
  @@all = []   
  #the Customer class should know about every customer instance that gets created.

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def waiters
  meals.map do |meal|
    meal.waiter
  end
end
  
  def meals
  Meal.all.select do |meal|
    meal.customer == self
  end
end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
 
end