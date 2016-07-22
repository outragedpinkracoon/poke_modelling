class Trainer

  attr_reader :name
  attr_accessor :location

  def initialize(name, location)
    @name = name
    @location = location
    @pokemon = []
    @pokeballs = 5
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

  def add_pokeballs(number)
    @pokeballs += number
  end

  def attempt_capture(pokemon)
    return false if pokeballs == 0
    #pokemon asleep
    #pokemon frozen
    #pokemon paralyzed
    #pokemon low hp
    #pokemon burned
  end


end