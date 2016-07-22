class Pokemon
  attr_reader :name, :pokedex_number, :location
  
  def initialize(name, pokedex_number, location)
    @name = name
    @pokedex_number = pokedex_number
    @location = location
  end

  def is_nearby?(trainer)
    return trainer.location.distance_to(@location) < 0.01
  end
end