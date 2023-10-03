require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    super() # Call the parent class (Nameable) constructor
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def generate_id
    # Implement your ID generation logic here
  end

  public

  def correct_name
    @name
  end
end
