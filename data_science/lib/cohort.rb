require 'json'
require_relative 'parser.rb'

class Cohort
  def initialize(cohort)
    @cohort = cohort
  end

  def size
    @cohort.length
  end

  def converts
    converts = []
    @cohort.each do |group|
      converts << group if group["result"] == 1
    end
    converts.length
  end

  def conversion_rate
    numerator = converts
    denominator = size.to_f
    ((numerator / denominator) * 100)
  end

  def standard_error
    p = (conversion_rate / 100)
    n = converts
    x = (p * (1 - p) / n)
    (Math.sqrt(x) * 2)
  end

  def state_rates
    low_end = conversion_rate - standard_error
    high_end = conversion_rate + standard_error
    p "Our conversion rate is between #{low_end} and #{high_end} percent."
  end
end
