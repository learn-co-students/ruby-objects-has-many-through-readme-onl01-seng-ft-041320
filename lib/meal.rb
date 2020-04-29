class Meal
  attr_accessor :customer, :tip, :total, :waiter

  @@all = []

  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer
    @tip = tip
    @total = total
    @@all << self
  end

  def self.all
    @@all
  end
end
