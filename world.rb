class World
  attr_reader :trainer

  def initialize(trainer, pokemon)
    @trainer = trainer
    @pokemon = pokemon
  end

  def pokemon
    return @pokemon.clone
  end
  
end