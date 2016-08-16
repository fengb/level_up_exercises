require "yaml"
class Arrowhead
  def initialize(classification_hash)
    @classification = classification_hash
  end

  def classify_region(region, type)
    if @classification.include? region
      shapes = @classification[region]
      classify_arrowhead(shapes, type)
    else
      raise "Unknown region, please provide a valid region."
    end
  end

  def classify_arrowhead(shapes, type)
    if shapes.include? type
      arrowhead = shapes[type]
      "You have a(n) '#{arrowhead}' arrowhead. Probably priceless."
    else
      raise "Unknown shape value. Do you know what you're talking about?"
    end
  end
end

hash = YAML.load_file("constant.yml")
arrowhead = Arrowhead.new(hash)
p arrowhead.classify_region("northern_plains", "bifurcated")
# data = YAML.load_file("yaml.rb")
# p data
# p arrowhead.classify_region(YAML.load_file("yaml.rb"))
