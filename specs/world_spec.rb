require 'minitest/autorun'
require 'minitest/rg' 
require 'minitest/mock' 
require "mocha/mini_test"
require "geokit"

require_relative('../models/world')
require_relative('../models/dice')
require_relative('../models/pokemon')
require_relative('../models/trainer')
require_relative '../config/geokit_config'

class WorldTest < Minitest::Test

  def setup
    @latlng = Geokit::LatLng.new(55.943037, -3.103274)

    @trainer = Trainer.new("Val", @latlng)

    @pikachu = Pokemon.new("Pikachu", 25, @latlng)
    @charmander = Pokemon.new("Charmander", 4, @latlng)
    @pokemon = [@pikachu, @charmander]

    @dice = Dice.new
    
    @world = World.new(@trainer, @pokemon, @dice)
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

  def test_search_long_grass_failure
    @dice.stubs(:success?).with(50).returns(false)
    found_pokemon = @world.search_long_grass
    assert_equal(found_pokemon, nil)
  end

  def test_pokemon_nearby
    pokemon = @world.nearby_pokemon
    assert_equal(2, pokemon.size)
  end

end