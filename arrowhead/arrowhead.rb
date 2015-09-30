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

class Arrowhead

  attr_reader :shape, :region_info

  def self.classify(region, shape)
    if CLASSIFICATIONS.include? region
      region_info = CLASSIFICATIONS[region]
      exists(region_info, shape)
    else
      raise "Unknown region, please provide a valid region."
    end
  end

  def self.exists(region_info, shape)
    if region_info.include? shape
      arrowhead = region_info[shape]
      "You have a(n) '#{arrowhead}' arrowhead. Probably priceless."
    else
      raise "Unknown shape value. Are you sure you know what you're talking about?"
    end
  end
end

puts Arrowhead.classify(:northern_plains, :bifurcated)
# Error Test
puts Arrowhead.classify(:far_west, :triangle)