class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date

    # Modify the associations
    @book.add_rental(self)
    @person.add_rental(self)
  end
end
