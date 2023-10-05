class Student < Person
  attr_reader :classroom

  def initialize(classroom, name: 'Unknown', age: nil, parent_permission: true)
    super(name => name, age => age, parent_permission => parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def classroom=(classroom)
    # Remove the student from the old classroom
    @classroom&.remove_student(self)

    # Update the classroom
    @classroom = classroom

    # Add the student to the new classroom
    classroom.add_student(self)
  end
end
