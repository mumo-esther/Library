require_relative 'book'

class BookManager
  def initialize
    @books = []
  end

  def list_books
    puts 'Books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts
  end

  def create_book
    print 'Enter Title: '
    title = gets.chomp
    print 'Enter Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
    puts
  end

  def books
    @books.dup
  end
end
