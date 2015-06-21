class Arrowhead
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody",
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow",
    },
  }

  def self.find_shapes(region)
    if CLASSIFICATIONS.include? region
      CLASSIFICATIONS[region]
    else
      raise "Unknown region, please provide a valid region."
    end
  end

  def self.find_arrowhead(region, shape)
    shapes = find_shapes(region)
    if shapes.include?(shape)
      shapes[shape]
    else
      raise "Unknown shape value, please provide a valid shape."
    end
  end

  def self.classify(region, shape)
    arrowhead = find_arrowhead(region, shape)
    "You have a(n) '#{arrowhead}' arrowhead.  Probably priceless."
  end

end

puts Arrowhead.classify(:northern_plains, :bifurcated)
