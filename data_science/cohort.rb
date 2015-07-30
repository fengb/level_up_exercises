require 'date'

class Cohort
  attr_reader :name
  attr_accessor :data

  def initialize(args = {})
    @data = args[:data] || []
    @name = args[:name] || ''
  end

  def dates
    @data.map { |t| Date.parse(t['date']) }
  end

  def results
    @data.map { |t| t['result'] }
  end

  def conversions
    results.inject(:+)
  end

  def non_conversions
    results.count { |v| v == 0 }
  end

  def total_sample_size
    results.count
  end
end
