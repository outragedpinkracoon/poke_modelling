class World
  attr_reader :trainer, :dice

  def initialize(trainer, pokemon, dice, pokemon_filter)
    @all_pokemon = pokemon
    @trainer = trainer
    @dice = dice
    @filter = pokemon_filter
  end

  def pokemon
    return @all_pokemon.clone
  end

  def search_long_grass
    pokemon = @filter.nearby_pokemon(@trainer, @all_pokemon)
    return nil unless pokemon.any?

    success = dice.success?(50)
    result = success ? pokemon.sample : nil
    return result
  end
  
end
