class PokemonFilter

  def nearby_pokemon(trainer, pokemon)
    close_pokemon = remove_far_away_pokemon(trainer, pokemon)

    result = close_pokemon.select do |pokemon|
      pokemon.is_nearby?(trainer)
    end
    
    return result
  end

  def remove_far_away_pokemon(trainer, pokemons)
    first_digits = first_two_digits(trainer.location)

    result = pokemons.select do |pokemon|
      diff = first_digits - first_two_digits(pokemon.location)
      diff = diff * -1 if diff < 1
      diff < 2
    end

    return result
  end

  def first_two_digits(latlng)
    return latlng.lat.to_s[0..1].to_i
  end
end