require_relative 'person'

class Student < Person
  attr_accessor :classroom

  # rubocop:disable all
  def initialize(id, age, parent_permission: true, name: 'Unknown')
    super(id, age, parent_permission:, name:)
    @classroom = nil
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
