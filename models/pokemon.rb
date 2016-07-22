class Pokemon
  attr_reader :name, :pokedex_number
  
  def initialize(name, pokedex_number)
    @name = name
    @pokedex_number = pokedex_number
  end

  def is_nearby?(trainer)
    return true
  end
end