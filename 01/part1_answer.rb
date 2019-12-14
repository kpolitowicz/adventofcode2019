require_relative 'fuel_requirement'

input_file = "#{__dir__}/part1_input.txt"

fuel_required = FuelRequirement.new

mass_of_modules = []
File.foreach(input_file) do |line|
  mass_of_modules << line.to_i
end

fuel_for_modules = mass_of_modules.map { |mass| fuel_required.for_mass(mass) }

puts fuel_required.total(fuel_for_modules)
