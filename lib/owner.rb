require "pry"

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self

  end

  def self.all
    @@all
  end

  def self.count
    self.all.length    # binding.pry
  end

  def self.reset_all
      self.all.clear
  end

  def say_species
    return "I am a #{self.species}."

  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
