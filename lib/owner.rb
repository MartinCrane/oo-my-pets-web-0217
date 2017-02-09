class Owner

	attr_accessor :mood, :pets
  	attr_reader :name, :species
  	
  	@@all = []
  	@@count = 0
  	@pets_initialize = {:fishes => [], :dogs => [], :cats => []}

	def initialize(name)
	  	# @name = name
	  	@species = "human"
	  	@@all << self
	  	@@count += 1 

	  	@pets = {:fishes => [], :dogs => [], :cats => []}
	  	@pets_initialize = {:fishes => [], :dogs => [], :cats => []}

	end

	def buy_fish(name)
		new_fish = Fish.new(name)
		@pets[:fishes] << new_fish
	end

	def buy_cat(name)
		new_cat = Cat.new(name)
		@pets[:cats] << new_cat
	end

	def buy_dog(name)
		new_dog = Dog.new(name)
		@pets[:dogs] << new_dog
	end

	def walk_dogs
		@pets[:dogs].each {|dog| dog.mood = "happy"}
	end

	def play_with_cats
		@pets[:cats].each {|cat| cat.mood = "happy"}
	end

	def feed_fish
		@pets[:fishes].each {|fish| fish.mood = "happy"}
	end
	  
	def sell_pets 
		@pets.each do |k,v|
			v.each do |animal|
				animal.mood = "nervous"
			end
		end

		@pets = @pets_initialize
		
	end

	def list_pets
		"I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
	end

	def name=(name)
	  	@name = name
	end

	  def self.all
	  	@@all
	  end

	  def self.reset_all
	  	@@all = []
	  	@@count = 0
	  end

	  def self.count
	  	@@count 
	  end

	  def say_species
	  	"I am a #{@species}."
	  end

end