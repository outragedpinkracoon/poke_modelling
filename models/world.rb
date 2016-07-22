class World
  attr_reader :trainer, :dice

  def initialize(trainer, pokemon, dice)
    @pokemon = pokemon
    @trainer = trainer
    @dice = dice
  end

  def pokemon
    return @pokemon.clone
  end

  def search_long_grass
    return nil unless a_pokemon_is_near?
    success = dice.success?(50)
    result = success ? @pokemon.sample : nil
    return result
  end

  def a_pokemon_is_near?
    return true
  end
  
end