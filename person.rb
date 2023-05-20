require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :age
  attr_accessor :name, :rentals

  def initialize(id, age, parent_permission: true, name: 'Unknown')
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
