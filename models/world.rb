class World
  attr_reader :trainer, :dice

  def initialize(pokemon, dice)
    @pokemon = pokemon
    @dice = dice
  end

  def pokemon
    return @pokemon.clone
  end

  def search_long_grass
    success = dice.success?(50)
    result = success ? @pokemon.sample : nil
    return result
  end

end