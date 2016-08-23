require 'json'
require_relative 'parser.rb'
require 'abanalyzer'

class Calculator
  def initialize(data_set, a, b)
    @data_set = data_set
    @a = a
    @b = b
  end

  def cohort_size(cohort)
    cohort.length
  end

  def converts(cohort)
    converts = []
    cohort.each do |group|
      converts << group if group["result"] == 1
    end
    converts.length
  end

  def conversion_rate(cohort)
    numerator = converts(cohort)
    denominator = cohort_size(cohort).to_f
    ((numerator / denominator) * 100).round(2)
  end

  def standard_error(cohort)
    p = (conversion_rate(cohort) / 100)
    n = converts(cohort)
    x = (p * (1 - p) / n)
    (Math.sqrt(x) * 2).round(2)
  end

  def state_rates(cohort)
    low_end = conversion_rate(cohort) - standard_error(cohort)
    high_end = conversion_rate(cohort) + standard_error(cohort)
    p "Our conversion rate is between #{low_end} and #{high_end} percent."
  end
end
