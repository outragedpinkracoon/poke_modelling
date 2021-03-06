require_relative('../models/trainer.rb')
require_relative('../models/pokemon.rb')
require_relative('../models/dice.rb')

require('minitest/autorun')
require('minitest/rg')
require "mocha/mini_test"
require('geokit')

class TestTrainer < MiniTest::Test

  def setup
    @latlng = Geokit::LatLng.new(55.943037, -3.103274)
    @trainer = Trainer.new("Valerie", @latlng)
    @pikachu = Pokemon.new("Pikachu", 25, @latlng)
  end

  def test_has_name
    assert_equal(@trainer.name, "Valerie")
  end

  def test_has_location
    assert_equal(@trainer.location, @latlng)
  end

  def test_can_update_location
    new_latlng = Geokit::LatLng.new(55.143037, -3.103274)
    @trainer.location = new_latlng
    assert_equal(@trainer.location, new_latlng)
  end

  def test_starts_with_no_pokemon
    assert_equal(@trainer.owned_pokemon, [])
  end

  def test_pokemon_is_read_only
    assert_equal(@trainer.owned_pokemon, [])
  end

  def test_can_catch_pokemon
    @trainer.catch_pokemon(@pikachu)
    assert_equal(@trainer.owned_pokemon[0], @pikachu)
  end

  def test_number_of_pokemon_caught
    assert_equal(@trainer.pokemon_caught, 0)
  end

  def test_attempt_capture_success
    dice = Dice.new
    dice.stubs(:success?).with(anything).returns(true)
    result = @trainer.attempt_capture(@pikachu, dice)
    assert_equal(result, true)
    assert_equal(@trainer.owned_pokemon.size, 1)
  end

  def test_attempt_capture_failure
    dice = Dice.new
    dice.stubs(:success?).with(anything).returns(false)
    result = @trainer.attempt_capture(@pikachu, dice)
    assert_equal(result, false)
    assert_equal(@trainer.owned_pokemon.size, 0)

  end


end