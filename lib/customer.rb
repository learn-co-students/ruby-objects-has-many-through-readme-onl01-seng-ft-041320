require "pry"

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

  def meals
    Meal.all.select do |meal|
      if self.name== meal.customer.name
        #binding.pry
        meal
      end
    end
  end

  def waiters
    array = []
  Meal.all.each do |meal|
      if meal.customer == self
          array << meal.waiter
      end
    end
    #binding.pry
    array.uniq
  end



  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end


end