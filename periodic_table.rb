# Run 'gem install json'
require 'json'

# Element model class file
require_relative 'models/element'

# Read json file
file = File.read('elements.json')
# Convert json file to hash
data_hash = JSON.parse(file)
# Extract elements array from hash
element_array = data_hash['elements']
# Loop through each element
element_array.each do |el_hash|
  # Makes a instance variable for each element called @name
  instance_variable_set("@#{el_hash['name'].downcase}", Element.new(el_hash))
end

# Example usage:
Element.print_all
puts "Total Count: #{Element.count}"

# Can access individual element attributes by @name.attribute
puts "Nitrogen Boil: #{@nitrogen.boil}"
puts "Sulfur Melt: #{@sulfur.melt}"

$foo = @carbon.element_box_string

require 'gosu'

class Window < Gosu::Window
 def initialize(width=640, height=480, fullscreen=false)
   super
   self.caption = 'Test'
   @message = Gosu::Image.from_text(
     self, $foo, Gosu.default_font_name, 50)
 end

 def draw
   @message.draw(20, 20, 0)
 end
end

 window = Window.new
 window.show
