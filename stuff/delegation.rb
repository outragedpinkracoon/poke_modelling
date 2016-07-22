require_relative "../models/dice"
require 'forwardable'

class MethodMissingDelegation

  def initialize
    @dice = Dice.new(100)
  end

  def method_missing(method, *args, &block)
    @dice.send(method, *args, &block) if Dice.method_defined? method.to_sym
  end

end

dice = MethodMissingDelegation.new
puts dice.roll

class ForwardableDelegaton
  extend Forwardable

  def_delegators :@dice, :success?, :roll

  def initialize
    @dice = Dice.new
  end

end

dice = ForwardableDelegaton.new
puts dice.roll
