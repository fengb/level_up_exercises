require 'json'
require 'abanalyzer'
require_relative './cohort.rb'

class Science
  attr_reader :file, :json
  attr_accessor :cohorts

  def initialize(file_path)
    @file = File.read(file_path)
    @cohorts = []
    @json = JSON.parse(@file)
  end

  def determine_cohort_names
    @json.map { |key| key['cohort'] }.uniq
  end

  def select_cohort_data(cohort_name)
    @json.select { |visitor| visitor['cohort'] == cohort_name }
  end

  def create_cohorts
    determine_cohort_names.each do |cohort|
      @cohorts << Cohort.new(name: cohort, data: select_cohort_data(cohort))
    end
  end

  def chi_squared
    values = prep_test(@cohorts)

    tester = ABAnalyzer::ABTest.new values
    tester.chisquare_p
  end

  def gtest_score
    values = prep_test(@cohorts)

    tester = ABAnalyzer::ABTest.new values
    tester.gtest_score
  end

  private

  def prep_test(cohorts)
    values = {}

    cohorts.each do |c|
      values[:"#{c.name}"] = { conversions: c.conversions, total: c.total_sample_size }
    end
    values
  end
end
