class Parser
  def initialize(file)
    @file = file
  end

  def json_parse
    file = File.read(@file)
    JSON.parse(file)
  end

  def group_a
    group_a = []
    json_parse.each do |hash|
      group_a << hash if hash["cohort"] == "A"
    end
    group_a
  end

  def group_b
    group_b = []
    json_parse.each do |hash|
      group_b << hash if hash["cohort"] == "B"
    end
    group_b
  end
end
