require('minitest/autorun') 
require('minitest/rg') 

require_relative('../models/world')
require_relative('../models/trainer')
require_relative('../models/pokemon')

class WorldTest < Minitest::Test

  def setup
    @trainer = Trainer.new("Valerie")
    @pikachu = Pokemon.new("Pikachu", 25)
    @charmander = Pokemon.new("Charmander", 4)
    @pokemon = [@pikachu, @charmander]
    @world = World.new(@trainer, @pokemon)
  end

  def test_world_has_trainer
    assert_equal(@world.trainer, @trainer)
  end

  def test_world_has_pokemon
    assert_equal(@world.pokemon, @pokemon)
  end

  def test_search_long_grass
    found_pokemon = @world.search_long_grass
    assert_equal(found_pokemon.class, Pokemon)
  end

end