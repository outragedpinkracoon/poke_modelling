require 'minitest/autorun'
require 'minitest/rg' 
require 'minitest/mock' 
require "mocha/mini_test"
require "geokit"

require_relative('../models/pokemon')
require_relative('../models/trainer')
require_relative('../models/pokemon_filter')
require_relative '../config/geokit_config'

class PokemonFilterTest < Minitest::Test

  def setup
    @latlng = Geokit::LatLng.new(55.943037, -3.103274)

    @trainer = Trainer.new("Val", @latlng)

    @pikachu = Pokemon.new("Pikachu", 25, @latlng)
    @charmander = Pokemon.new("Charmander", 4, @latlng)
    @pokemon = [@pikachu, @charmander]

    @filter = PokemonFilter.new
  end

  def test_pokemon_nearby
    pokemon = @filter.nearby_pokemon(@trainer, @pokemon)
    assert_equal(2, pokemon.size)
  end

end