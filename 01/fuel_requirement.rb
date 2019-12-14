class FuelRequirement
  def for_mass(mass)
    mass / 3 - 2
  end

  def total(ary_of_req)
    ary_of_req.sum
  end
end
