require 'minitest/autorun'

require_relative 'fuel_requirement'

class FuelRequirementTest < Minitest::Test
  def test_calculates_fuel_requirements
    fuel_required = FuelRequirement.new

    assert_equal fuel_required.fuel_required_for_mass_of(12), 2
    assert_equal fuel_required.fuel_required_for_mass_of(14), 2
    assert_equal fuel_required.fuel_required_for_mass_of(1969), 654
    assert_equal fuel_required.fuel_required_for_mass_of(100756), 33583
  end
end
