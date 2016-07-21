require_relative('../models/trainer.rb')
require_relative('../models/pokemon.rb')
require('minitest/autorun')
require('minitest/rg')

class TestTrainer < MiniTest::Test

  def setup
    @trainer = Trainer.new("Valerie")
    @pikachu = Pokemon.new("Pikachu",25)
  end

  def test_has_name
    assert_equal(@trainer.name, "Valerie")
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

end