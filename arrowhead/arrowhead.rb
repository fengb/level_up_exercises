class Arrowhead
  # This seriously belongs in a database.
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody"
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow"
    }
  }.freeze

  def self.classify(region, shape)
    shapes = CLASSIFICATIONS[region]
    wrong_region = "Unknown region, please provide a valid region."
    raise wrong_region unless CLASSIFICATIONS.include? region
    arrowhead = shapes[shape]
    wrong_shape = "Unknown shape value."
    raise wrong_shape unless shapes.include? shape
    "You have a(n) '#{arrowhead}' arrowhead. Probably priceless."
  end
end

puts Arrowhead.classify(:northern_plains, :bifurcated)
