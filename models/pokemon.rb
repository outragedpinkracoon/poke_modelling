class Pokemon
  attr_reader :name, :pokedex_number
  attr_accessor :location
  
  def initialize(name, pokedex_number, location)
    @name = name
    @pokedex_number = pokedex_number
    @location = location
  end

  def is_nearby?(trainer)
    return @location.distance_to(trainer.location) < 0.01
  end
end