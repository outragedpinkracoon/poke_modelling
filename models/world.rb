class World
  attr_reader :trainer

  def initialize(trainer, pokemon, dice)
    @trainer = trainer
    @pokemon = pokemon
  end

  def pokemon
    return @pokemon.clone
  end

  def search_long_grass
    
    return @pokemon.sample
  end
  
end