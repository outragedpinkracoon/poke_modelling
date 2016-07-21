require('minitest/autorun') 
require('minitest/rg') 
require_relative('../world')
require_relative('../trainer')
require_relative('../pokemon')

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

end