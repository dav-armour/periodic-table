# Defining a new class called element
class Element
  def initialize prop_hash
    prop_hash.each do |key,value|
      instance_variable_set("@#{key}", value)
      # Creates Getter for each attribute
      self.class.define_method key do
        instance_variable_get("@#{key}")
      end
    end
    self.class.all << self
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
    print "Atomic Number: #{@number}\n"
  end

  # Instance method of each
  def rounded_weight
    @atomic_mass.round
  end

end

