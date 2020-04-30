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
 
#returns an Array of Meal instances 
#associated with this customer    
    def meals
      Meal.all.select do |meal|
        meal.customer == self
      end
    end
   
#returns an Array of Waiter instances 
#associated with this customer's meals"   
    def waiters
      meals.map do |meal|
        meal.waiter 
      end
    end
   
#initializes a meal using the current Customer 
#instance, a provided Waiter instance and a total and tip
#def initialize(waiter, customer, total, tip=0)    
    def new_meal(waiter, total, tip=0)
    Meal.new(waiter,self, total, tip)
      end
     
      def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
      end
  end