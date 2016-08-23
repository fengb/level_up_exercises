class Parser
  def initialize(file)
    @file = file
  end

  def json_parse
    file = File.read(@file)
    JSON.parse(file)
  end

  def separate_groups(cohort)
    group = []
    json_parse.each do |hash|
      group << hash if hash["cohort"] == cohort
    end
    group
  end
end
