require 'minitest/autorun'

require_relative 'fuel_requirement'

class FuelRequirementTest < Minitest::Test
  def test_calculates_fuel_requirements_for_given_mass
    fuel_required = FuelRequirement.new

    assert_equal 2, fuel_required.for_mass(12)
    assert_equal 2, fuel_required.for_mass(14)
    assert_equal 654, fuel_required.for_mass(1969)
    assert_equal 33583, fuel_required.for_mass(100756)
  end

  def test_calculates_total_fuel_needed
    fuel_required = FuelRequirement.new

    assert_equal 102751, fuel_required.total([12, 14, 1969, 100756])
  end

  def test_calculates_fuel_requirements_including_additional_fuel
    fuel_required = FuelRequirement.new

    assert_equal 2, fuel_required.for_mass_incl_fuel(14)
    assert_equal 966, fuel_required.for_mass_incl_fuel(1969)
    assert_equal 50346, fuel_required.for_mass_incl_fuel(100756)
  end
end
