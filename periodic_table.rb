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
