class World
  attr_reader :trainer, :dice

  def initialize(trainer, pokemon, dice)
    @all_pokemon = pokemon
    @trainer = trainer
    @dice = dice
  end

  def pokemon
    return @all_pokemon.clone
  end

  def search_long_grass
    pokemon = nearby_pokemon()
    return nil unless pokemon.any?

    success = dice.success?(50)
    result = success ? pokemon.sample : nil
    return result
  end

  def nearby_pokemon
    result = @all_pokemon.select do |pokemon|
      pokemon.is_nearby?(@trainer)
    end
    return result
  end

end