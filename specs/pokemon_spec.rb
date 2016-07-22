require('minitest/autorun')
require('minitest/rg')
require('geokit')

require_relative('../models/pokemon.rb')
require_relative('../models/trainer.rb')

class TestPokemon < MiniTest::Test

  def setup
    @latlng = Geokit::LatLng.new(55.943037, -3.103274)
    @pokemon = Pokemon.new("Pikachu", 25, @latlng)
    @trainer = Trainer.new("Val", @latlng)
  end

  def test_has_name
    assert_equal(@pokemon.name, "Pikachu")
  end

  def test_has_location
    assert_equal(@pokemon.location, @latlng)
  end

  def test_can_update_location
    new_latlng = Geokit::LatLng.new(55.143037, -3.103274)
    @pokemon.location = new_latlng
    assert_equal(@pokemon.location, new_latlng)
  end

  def test_has_pokedex_number
    assert_equal(@pokemon.pokedex_number, 25)
  end

  def test_is_nearby_trainer
    result = @pokemon.is_nearby?(@trainer)
    assert_equal(result, true)
  end

end