class Cat

  attr_reader :name, :mood
  attr_accessor :owner
  
@@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def mood=(mood)
    @mood = mood
  end

end
