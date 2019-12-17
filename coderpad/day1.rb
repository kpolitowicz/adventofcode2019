require 'rspec/autorun'

class FuelRequirement
  def for_mass(mass)
    mass / 3 - 2
  end

  def total(ary_of_req)
    ary_of_req.sum
  end

  def for_mass_incl_fuel(mass)
    all_fuel = []
    fuel_mass = mass

    while (fuel_mass = for_mass(fuel_mass)) > 0 do
      all_fuel << fuel_mass
    end

    total(all_fuel)
  end
end

RSpec.describe FuelRequirement do
  it 'calculates fuel required for given mass' do
    fr = FuelRequirement.new

    expect(fr.for_mass(12)).to eq(2)
    expect(fr.for_mass(14)).to eq(2)
    expect(fr.for_mass(1969)).to eq(654)
    expect(fr.for_mass(100756)).to eq(33583)
  end

  it 'calculates total fuel needed' do
    fr = FuelRequirement.new

    expect(fr.total([12, 14, 1969, 100756])).to eq(102751) 
  end

  it 'calculates all fuel req incl addition fuel for fuel' do
    fr = FuelRequirement.new

    expect(fr.for_mass_incl_fuel(14)).to eq(2)
    expect(fr.for_mass_incl_fuel(1969)).to eq(966)
    expect(fr.for_mass_incl_fuel(100756)).to eq(50346)
  end
end

