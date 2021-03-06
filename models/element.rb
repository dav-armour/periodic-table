# Defining a new class called element
class Element

  def initialize prop_hash
    prop_hash.each do |key,value|
      instance_variable_set("@#{key}", value)
      # Creates Getter for each attribute
      if self.class.count == 0
        self.class.define_method key do
          instance_variable_get("@#{key}")
        end
      end
    end
    self.class.all << self
    self.class.element_hashes << self.element_hash
  end

  # class instance variable to store all elements
  @elements = []
  @element_hashes = []

  # Returns array of all elements
  def self.all
    @elements
  end

  def self.element_hashes
    @element_hashes
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

  # Returns hash of element attribute string and position in table
  def element_hash
    # Construct string with basic element attributes
    string = "#{@number}\n#{@symbol}\n#{@name}\n#{rounded_weight}\n"
    { string: string, xpos: @xpos, ypos: @ypos }
  end

  # Makes a box to display element details
  def element_box_string
    box = "-" * 14
    box += "\n|" + "#{@number}".ljust(12) + "|"
    box += "\n|" + "#{@symbol}".ljust(12) + "|"
    box += "\n|" + "#{@name}".ljust(12) + "|"
    box += "\n|" + "#{@atomic_mass}".ljust(12) + "|\n"
    box += "-" * 14
  end

  # Prints out attributes of each element
  def print_element
    puts element_box_string
  end

  # Instance method of each
  def rounded_weight
    @atomic_mass.round(4)
  end

end

