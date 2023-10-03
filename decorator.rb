require_relative 'Nameable'

class Decorator < Nameable
  def initialize(nameable)
    super() # Call super to initialize the parent class
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
