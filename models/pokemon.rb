class Pokemon
  attr_reader :name, :pokedex_number
  attr_accessor :location
  
  def initialize(name, pokedex_number, location)
    @name = name
    @pokedex_number = pokedex_number
    @location = location
    @nearby_range = 0.001
  end

  def is_nearby?(trainer)
    return @location.distance_to(trainer.location) < @nearby_range
  end
end