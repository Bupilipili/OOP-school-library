require_relative 'nameable'
require_relative 'rental' # Make sure to require the Rental class

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super() # Call super to initialize state of the parent class (Nameable)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    @rentals << Rental.new(book, self, date)
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    # Implement your ID generation logic here
  end
end
