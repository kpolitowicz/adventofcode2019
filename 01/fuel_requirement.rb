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

    all_fuel.sum
  end
end
