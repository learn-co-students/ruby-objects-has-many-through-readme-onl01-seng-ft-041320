class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, experience)
    @name = name
    @yrs_experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max {|meal1, meal2| meal1.tip <=> meal2.tip}
    best_tipped_meal.customer
  end

  def most_frequent_customer
    customer_visits = {}
    meals.each do |meal|
      customer_visits[:meal.customer.name] += 1
    end
    customer_visits.key(customer_visits.values.max)
  end
end
