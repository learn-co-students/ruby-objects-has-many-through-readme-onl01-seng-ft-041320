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

  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def self.all
    @@all
  end

  def meals
    Meal.all
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  
  def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
  end

end
