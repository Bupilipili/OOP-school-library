require_relative 'nameable'

class Decorator < Nameable
  def initialize(nameable)
    super() # Call super to initialize the parent class
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
