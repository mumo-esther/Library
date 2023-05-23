require_relative 'person_manager'
require_relative 'book_manager'
require_relative 'rental_manager'

class Menu
  def initialize
    @person_manager = PersonManager.new
    @book_manager = BookManager.new
    @rental_manager = RentalManager.new
  end

  def start
    loop do
      display_options
      choice = gets.chomp.to_i

      case choice
      when 1
        @book_manager.list_books
      when 2
        @person_manager.list_people
      when 3
        @person_manager.create_person
      when 4
        @book_manager.create_book
      when 5
        @rental_manager.create_rental(@person_manager.people, @book_manager.books)
      when 6
        @rental_manager.list_rentals_for_person(@person_manager.people)
      when 7
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end

    puts 'Thank you for using this app.'
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
end
