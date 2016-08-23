require_relative 'dinofinder.rb'
require_relative 'parser.rb'

parser = Parser.new
parser.dinodex_parse
parser.african_parse
all_dinos = parser.merge

dinofinder = DinoFinder.new(all_dinos)

if ARGV[0] == "bipeds"
  dinofinder.bipeds
elsif ARGV[0] == "carnivores"
  dinofinder.carnivores
elsif ARGV[0] == "big"
  dinofinder.big_dinos
elsif ARGV[0] == "small"
  dinofinder.small_dinos
elsif ARGV[0] == "Find"
  name = ARGV[1]
  dinofinder.find_dino(name)
end

# last thing we need to do is figure out how we want to get it done
