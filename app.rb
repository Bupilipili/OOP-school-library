require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    welcome_message

    loop do
      display_menu
      choice = user_choice
      break if choice == 7

      execute_choice(choice)
    end

    goodbye_message
  end

  private

  def welcome_message
    puts 'Welcome to the Library App!'
  end

  def goodbye_message
    puts 'Thank you for using the Library App. Goodbye!'
  end

  def display_menu
    puts 'Please choose an option:'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person (teacher or student).'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals for a given person id.'
    puts '7. Quit.'
  end

  def user_choice
    print 'Enter your choice: '
    gets.chomp.to_i
  end

  def execute_choice(choice)
    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      execute_create_person
    when 4
      execute_create_book
    when 5
      execute_create_rental
    when 6
      list_rentals_for_person
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def list_all_books
    puts 'List of all books:'
    @books.each_with_index { |book, index| puts "#{index + 1}. #{book.title} by #{book.author}" }
  end

  def list_all_people
    puts 'List of all people:'
    @people.each_with_index { |person, index| puts "#{index + 1}. #{person.name}" }
  end

  def create_student(classroom, name, age, parent_permission)
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    @people << student
    student
  end

  def create_teacher(name, age, parent_permission, specialization)
    teacher = Teacher.new(name, age, parent_permission, specialization)
    @people << teacher
    teacher
  end

  def execute_create_person
    print 'Enter name: '
    name = gets.chomp

    print 'Enter age: '
    age = gets.chomp.to_i

    print 'Enter parent permission (true/false): '
    parent_permission = gets.chomp.downcase == 'true'

    print 'Enter type (student/teacher): '
    type = gets.chomp.downcase

    if type == 'student'
        print 'Enter classroom: '
      classroom = gets.chomp  
      student = create_student(classroom, name, age, parent_permission)
      puts "Student created: #{student.name}"
    elsif type == 'teacher'
      print 'Enter specialization: '
      specialization = gets.chomp
      teacher = create_teacher(specialization, age, name: name)
      puts "Teacher created: #{teacher.name}"
    else
      puts 'Invalid type. Please try again.'
    end
  end

  def execute_create_book
    print 'Enter title: '
    title = gets.chomp

    print 'Enter author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "Book created: #{book.title} by #{book.author}"
  end

  def execute_create_rental
    puts 'Select a book:'
    list_all_books
    book_index = gets.chomp.to_i - 1
    return puts 'Invalid book selection.' if book_index < 0 || book_index >= @books.length

    book = @books[book_index]

    puts 'Select a person:'
    list_all_people
    person_index = gets.chomp.to_i - 1
    return puts 'Invalid person selection.' if person_index < 0 || person_index >= @people.length

    person = @people[person_index]

    print 'Enter rental date (format: YYYY-MM-DD): '
    rental_date = gets.chomp

    rental = Rental.new(book, person, rental_date)
    @rentals << rental
    puts "Rental created: #{book.title} rented by #{person.name} on #{rental_date}"
  end

  def list_rentals_for_person
    puts 'Select a person:'
    list_all_people
    person_index = gets.chomp.to_i - 1
    return puts 'Invalid person selection.' if person_index < 0 || person_index >= @people.length

    person = @people[person_index]

    puts "Rentals for #{person.name}:"
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each { |rental| puts "#{rental.book.title} rented on #{rental.date}" }
  end
end

# Uncomment the following line if you want to run the app directly using `ruby app.rb`
# App.new.run
