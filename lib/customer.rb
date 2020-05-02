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

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        # returns and array of meal instances associated with the customer
        Meal.all.select{|meal| meal.customer == self}
    end

    def waiters
        meals.map{|meal| meal.waiter}
    end

end
