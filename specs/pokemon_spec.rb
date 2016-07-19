require_relative('../pokemon.rb')
require('minitest/autorun')
require('minitest/rg')

class TestPokemon < MiniTest::Test

  def setup
    @pokemon = Pokemon.new("Pikachu")
  end

  def test_has_name
    assert_equal(@pokemon.name, "Pikachu")
  end

end