require_relative 'rental'
require_relative 'book'
require_relative 'person'

class RentalManager
  def initialize
    @rentals = []
  end

  def create_rental(people, books)
    puts 'Enter Rental Date: '
    date = gets.chomp

    list_books(books)
    puts 'Choose a book (enter the number): '
    book_number = gets.chomp.to_i
    book = books[book_number - 1]

    list_people(people)
    puts 'Choose a person (enter the number): '
    person_number = gets.chomp.to_i
    person = people[person_number - 1]

    rental = Rental.new(date, person, book)
    @rentals << rental

    puts 'Rental created successfully.'
  end

  def list_rentals_for_person(people)
    print 'Enter Person ID: '
    person_id = gets.chomp.to_i

    rentals_for_person = @rentals.select { |rental| rental.person.id == person_id }

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

  def list_books(books)
    puts 'Books:'
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts
  end

  def list_people(people)
    puts 'People:'
    people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name} (#{person.class})"
    end
    puts
  end
end
