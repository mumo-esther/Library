require_relative 'person'
require_relative 'id_generator'
require_relative 'student'
require_relative 'teacher'

class PersonManager
  def initialize
    @people = []
  end

  def list_people
    puts 'People:'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name} (#{person.class}), ID: #{person.id}"
    end
    puts
  end  

  def create_person # rubocop:todo Metrics/MethodLength
    puts 'Do you want to create a student[1] or a teacher[2]? Enter the number.'
    person_type = gets.chomp.to_i

    print 'Enter Age: '
    age = gets.chomp.to_i
    print 'Enter Name: '
    name = gets.chomp

    case person_type
    when 1
      print 'No parent permission [Y/N]: '
      parent_permission = gets.chomp.upcase == 'N'
      student = Student.new(IdGenerator, age, parent_permission: parent_permission, name: name)
      @people << student
      puts 'Student created successfully.'
    when 2
      print 'Enter Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(IdGenerator, age, specialization, name: name)
      @people << teacher
      puts 'Teacher created successfully.'
    else
      puts 'Invalid person type. Please try again.'
    end

    puts
  end
  def people
    @people.dup
  end
end
