class Trainer
  attr_reader :name, :pokemon
  def initialize(name)
    @name = name
    @pokemon = []
  end
end