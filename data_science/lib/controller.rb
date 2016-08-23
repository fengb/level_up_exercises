require_relative 'parser.rb'
require_relative 'calculator.rb'

parser = Parser.new('data_export.json')
data_set = parser.json_parse
group_a = parser.group_a
group_b = parser.group_b
calculator = Calculator.new(data_set, group_a, group_b)
p calculator.cohort_size(group_b)
p calculator.converts(group_b)
p calculator.confidence_interval
p calculator.standard_error(group_b)
p calculator.conversion_rate(group_b)
calculator.values
calculator.state_rates(group_b)
# p calculator.conversion_rate(group_b)
# p calculator.confidence_interval(group_b)
