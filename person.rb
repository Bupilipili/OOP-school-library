require_relative 'Nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    super() # Call super to initialize state of the parent class (Nameable)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def generate_id
    # Implement your ID generation logic here
  end

  def add_rental(rental)
    @rentals << rental
  end
end
