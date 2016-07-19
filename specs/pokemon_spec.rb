require_relative('../pokemon.rb')
require('minitest/autorun')
require('minitest/rg')

class TestPokemon < MiniTest::Test

  def setup
    @pokemon = Pokemon.new("Pikachu", 25)
  end

  def test_has_name
    assert_equal(@pokemon.name, "Pikachu")
  end

  def test_has_pokedex_number
    assert_equal(@pokemon.pokedex_number, 25)
  end

end