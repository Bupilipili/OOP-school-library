class App
  def initialize
    # Initialize any required resources here
  end

  def run
    welcome_message

    loop do
      display_menu
      choice = get_user_choice
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
      execute_list_books
    when 2
      execute_list_people
    when 3
      execute_create_person
    when 4
      execute_create_book
    when 5
      execute_create_rental
    when 6
      execute_list_rentals_for_person
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  # Define your other methods here for each choice
end
