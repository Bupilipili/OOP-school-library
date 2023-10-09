require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name: 'Unknown')
    super(age, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true # Teachers can always use services
  end
end
