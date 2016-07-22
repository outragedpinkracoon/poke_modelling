class Trainer

  attr_reader :name
  attr_accessor :location

  def initialize(name, location)
    @name = name
    @location = location
    @pokemon = []
  end

  def owned_pokemon
    return @pokemon.clone
  end

  def catch_pokemon(pokemon)
    @pokemon << pokemon
  end

  def pokemon_caught
    return @pokemon.size
  end

end