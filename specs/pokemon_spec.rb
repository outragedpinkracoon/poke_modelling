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

  def test_is_not_nearby_trainer
    @trainer.location = Geokit::LatLng.new(55.943037, -3.103244)
    result = @pokemon.is_nearby?(@trainer)
    assert_equal(result, false)
  end

  def test_add_status_effect
    @pokemon.add_status(:burned)
    assert_equal(@pokemon.status_effects.size,1)
  end

  def test_capture_chance
    @pokemon.add_status(:burned)
    @pokemon.add_status(:frozen)
    assert_equal(@pokemon.capture_chance, 30)
  end

end