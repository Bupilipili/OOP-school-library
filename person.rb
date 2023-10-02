class Person
    attr_reader :id, :name, :age
  
    def initialize(name: 'Unknown', age: nil, parent_permission: true)
      @id = generate_id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    private
  
    def of_age?
      @age >= 18
    end
  
    public
  
    def can_use_services?
      of_age? || @parent_permission
    end
  
    private
  
    def generate_id
      # Implement your ID generation logic here
    end
  end
  