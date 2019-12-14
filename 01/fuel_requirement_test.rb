require 'minitest/autorun'

require_relative 'fuel_requirement'

class FuelRequirementTest < Minitest::Test
  def test_calculates_fuel_requirements
    fuel_required = FuelRequirement.new

    assert_equal fuel_required.for_mass(12), 2
    assert_equal fuel_required.for_mass(14), 2
    assert_equal fuel_required.for_mass(1969), 654
    assert_equal fuel_required.for_mass(100756), 33583
  end
end
