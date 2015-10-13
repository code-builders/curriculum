class Planet

  def initialize(attrs) #2
    # attrs = {name: "Earth", mass: 9838}
    @name_var = attrs[:name_key] #3
    @mass_var = attrs[:mass_key]
  end

  def name_method #5
    @name_var #6
  end

  def mass_method
    @mass_var
  end
end

class SolarSystem

  def initialize(planets)
    # attrs = "Pineapple"
    @planets_var = planets
  end

  def planets_method
    @planets_var
  end
end

hash_o_attrs = {name_key: "Earth", mass_key: 9838}
earth = Planet.new(hash_o_attrs) #1

mercury_hash = {name_key: "Mercury", mass_key: 9838}
mercury = Planet.new(mercury_hash)

array_of_planets = [earth, mercury]
ss = SolarSystem.new(array_of_planets)
ss.planets_method

puts ss.planets_method.first.name

# ss => SolarSystem instance <#SolarSystem:234234234>
# .planets_method => Array []
# .first => Planet <#Planet:234234234>
# .name => String "Earth"
