class Waiter

    attr_accessor :name, :yrs_of_experience
    @@all = []
    def initialize(name, yrs_of_experience)
        @name = name
        @yrs_of_experience = yrs_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        best_at_tip = meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip
        end
        best_at_tip.customer
    end


end
