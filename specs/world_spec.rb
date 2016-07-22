require 'minitest/autorun'
require 'minitest/rg' 
require 'minitest/mock' 
require "mocha/mini_test"

require_relative('../models/world')
require_relative('../models/dice')
require_relative('../models/pokemon')

class WorldTest < Minitest::Test

  def setup
    @pikachu = Pokemon.new("Pikachu", 25)
    @charmander = Pokemon.new("Charmander", 4)
    @pokemon = [@pikachu, @charmander]
    @dice = Dice.new
    @world = World.new(@pokemon, @dice)
  end

  def test_world_has_trainer
    assert_equal(@world.trainer, @trainer)
  end

  def test_world_has_pokemon
    assert_equal(@world.pokemon, @pokemon)
  end

  def test_world_has_dice
    assert_equal(@world.dice, @dice)
  end

  def test_search_long_grass_success
    @dice.stubs(:success?).with(50).returns(true)
    found_pokemon = @world.search_long_grass
    assert_equal(found_pokemon.class, Pokemon)
  end

end