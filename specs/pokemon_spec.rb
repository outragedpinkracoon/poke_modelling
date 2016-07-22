require_relative('../models/pokemon.rb')
require('minitest/autorun')
require('minitest/rg')

class TestPokemon < MiniTest::Test

  def setup
    @latlng = Geokit::LatLng.new(55.943037, -3.103274)
    @pokemon = Pokemon.new("Pikachu", 25, latlng)
  end

  def test_has_name
    assert_equal(@pokemon.name, "Pikachu")
  end

  def test_has_location
    assert_equal(@pokemon.location, @latlng)
  end

  def test_has_pokedex_number
    assert_equal(@pokemon.pokedex_number, 25)
  end

end