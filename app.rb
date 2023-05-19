require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  attr_reader :classrooms, :people, :books, :rentals

  def initialize
    @classrooms = []
    @people = []
    @books = []
    @rentals = []
  end

  def display_options
    puts 'Please choose an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Quit'
    print 'Enter your choice: '
  end

  def list_books
    puts 'Books:'
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts
  end

  def list_people
    puts 'People:'
    people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name} (#{person.class})"
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
    # rubocop:disable
    case person_type
    when 1
      print 'No parent permission [Y/N]: '
      parent_permission = gets.chomp.upcase == 'N'
      student = Student.new(generate_id, age, parent_permission:, name:)
      people << student
      puts 'Student created successfully.'
    when 2
      print 'Enter Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(generate_id, age, specialization, name:)
      people << teacher
      puts 'Teacher created successfully.'
    else
      puts 'Invalid person type. Please try again.'
    end
    puts
  end

  def create_book
    print 'Enter Title: '
    title = gets.chomp
    print 'Enter Author: '
    author = gets.chomp

    book = Book.new(title, author)
    books << book
    puts 'Book created successfully.'
    puts
  end

  def create_rental
    puts 'Enter Rental Date: '
    date = gets.chomp

    list_books
    puts 'Choose a book (enter the number): '
    book_number = gets.chomp.to_i
    book = @books[book_number - 1]

    list_people
    puts 'Choose a person (enter the number): '
    person_number = gets.chomp.to_i
    person = @people[person_number - 1]

    rental = Rental.new(date, person, book)
    @rentals << rental

    puts 'Rental created successfully.'
  end

  def list_rentals_for_person
    print 'Enter Person ID: '
    person_id = gets.chomp.to_i

    rentals_for_person = rentals.select { |rental| rental.person.id == person_id }

    if rentals_for_person.empty?
      puts 'No rentals found for the given person ID.'
    else
      puts "Rentals for Person ID #{person_id}:"
      rentals_for_person.each do |rental|
        puts "Book: #{rental.book.title} by #{rental.book.author}, Date: #{rental.date}"
      end
    end
    puts
  end

  private

  def generate_id
    @id_generator ||= 0
    @id_generator += 1
  end
end
