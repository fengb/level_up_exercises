# rubocop:disable Metrics/MethodLength
require 'csv'

class Parser
  def dinodex_parse
    dinosaur_hash = []
    CSV.foreach('dinodex.csv', headers: true) do |row|
      dinosaur_hash << ({
        name: row["NAME"],
        period: row["PERIOD"],
        continent: row["CONTINENT"],
        weight: row["WEIGHT_IN_LBS"],
        diet: row["DIET"],
        walking: row["WALKING"],
        description: row["DESCRIPTION"]
      })
    end
    dinosaur_hash
  end

  def african_parse
    second_hash = []
    CSV.foreach('african_dinosaur_export.csv', headers: true) do |row|
      second_hash << ({
        name: row["Genus"],
        period: row["Period"],
        weight: row["Weight"],
        carnivore: row["Carnivore"],
        walking: row["Walking"]
      })
    end
    second_hash
  end

  def merge
    dinodex_parse + african_parse
  end
end
