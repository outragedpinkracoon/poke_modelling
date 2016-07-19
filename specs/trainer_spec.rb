require_relative('../trainer.rb')
require('minitest/autorun')
require('minitest/rg')

class TestTrainer < MiniTest::Test

  def setup
    @trainer = Trainer.new("Valerie")
  end

  def test_has_name
    assert_equal(@trainer.name, "Valerie")
  end

  def test_starts_with_no_pokemon
    assert_equal(@trainer.pokemon, [])
  end

end