require "pry"

class Waiter

  attr_accessor :name, :years, :meals
  @@all = []
  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end

  def best_tipper
    toptip = 0
    Meal.all.each do |meal|
      if meal.tip > toptip
        toptip = meal.tip
      end
    end
    toptipper = Meal.all.select {|meal| meal.customer if meal.tip == toptip}

    toptipper[0].customer
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def self.all
    @@all
  end

  def meals
    array = []
    Meal.all.each do |meal|
      if meal.waiter == self
        array << meal
        #binding.pry
      end
    end
    array
  end

end