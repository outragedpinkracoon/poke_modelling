class Dice

  def initialize(number_of_sides = 100)
    @sides = number_of_sides
  end

  def roll
    return rand(1..@sides)
  end

  def success?(threshold)
    return roll >= threshold
  end

end

