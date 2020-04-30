class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    
#initializes a meal using the current Waiter 
#instance, a provided Customer instance and a 
#total and tip
#def initialize(waiter, customer, total, tip=0)
    def new_meal(customer, total, tip=0)
    Meal.new(self,customer, total, tip)
      end
    
#Array of Meal instances associated with this waiter
    def meals
    Meal.all.select {|meal| meal.waiter == self}
    end

#returns the Customer instance associated with the 
#meal that received the largest tip
    def best_tipper
    best_tip = meals.detect.max do |a,b|
        a.tip <=> b.tip
    end
    best_tip.customer
    end
end