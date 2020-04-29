class Waiter
    attr_accessor :name, :years_of_experience
    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        best_tip = 0
        best_tipper = ""
        self.meals.each do |meal|
            if (meal.tip > best_tip)
                best_tip = meal.tip
                best_tipper = meal.customer
            end
        end
        best_tipper
    end
end