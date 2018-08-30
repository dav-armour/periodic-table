# Defining a new class called element
class Element
  # Creates Getter / Setter for each attribute
  attr_accessor :name, :atomic_weight, :atomic_number

  # Instance method that gets run when a new element is created
  def initialize name, atomic_weight, atomic_number
    # Assign instance variables using passed in 
    @name = name
    @atomic_weight = atomic_weight
    @atomic_number = atomic_number
    # put self into elements array
    Element.all.push self
  end

  # class instance variable to store all elements
  @elements = []

  # Returns array of all elements
  def self.all
    @elements
  end

  # Returns number of element instances. counts the array...
  def self.count
    @elements.count
  end

  # Prints out all elements
  def self.print_all
    # loops through each element
    @elements.each do |e|
      # calls print instance method on each element
      e.print_element
    end
  end

  # Prints out attributes of each element
  def print_element
    print "Name: #{@name.capitalize} | "
    print "Automic Weight: #{rounded_weight} | "
    print "Atomic Number: #{@atomic_number}\n"
  end

  # Instance method of each
  def rounded_weight
    @atomic_weight.round
  end

end

