require_relative 'app'

# rubocop:todo Metrics/MethodLength
def main # rubocop:todo Metrics/CyclomaticComplexity, Metrics/MethodLength
  app = App.new

  loop do
    app.display_options
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      puts 'Thank you for using this app.'
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end
# rubocop:enable Metrics/MethodLength

main
