require 'minitest/autorun'

require_relative 'fuel_requirement'

class FuelRequirementTest < Minitest::Test
  def test_calculates_fuel_requirements_for_given_mass
    fuel_required = FuelRequirement.new

    assert_equal fuel_required.for_mass(12), 2
    assert_equal fuel_required.for_mass(14), 2
    assert_equal fuel_required.for_mass(1969), 654
    assert_equal fuel_required.for_mass(100756), 33583
  end

  def test_calculates_total_fuel_needed
    fuel_required = FuelRequirement.new

    assert_equal fuel_required.total([12, 14, 1969, 100756]), 102751
  end
end
