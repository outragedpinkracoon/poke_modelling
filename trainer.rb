class Trainer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @pokemon = []
  end

  def owned_pokemon
    return @pokemon.clone
  end

end