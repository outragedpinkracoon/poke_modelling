class Dice

  def initialize(number_of_sides)
    @sides = number_of_sides
  end

  def roll
    return rand(1..@sides)
  end

  def success?(threshold)
    result = roll
    success = roll >= threshold
  end

end