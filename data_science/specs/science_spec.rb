require 'rspec'
require 'json'
require_relative '../science.rb'

RSpec.describe 'Science' do
  let (:main_file) { '../data_export_2014_06_20_15_59_02.json' }
  let (:test_file) { '../test_data.json' }

  before :each do
    @science = Science.new(main_file)
    @test_science = Science.new(test_file)
  end

  describe '#new' do
    it 'returns a new Science object' do
      expect(@science).to be_an_instance_of Science
    end

    it 'instantiates cohorts as a Array' do
      expect(@science.cohorts).to be_a Array
    end

    it 'instantiates cohorts as empty' do
      expect(@science.cohorts).to be_empty
    end

    it 'instantiates by opening a file' do
      expect(@science.file).to be_an_instance_of String
    end

    it 'parses a string of json into an Array' do
      expect(@science.json).to be_a Array
    end

    it 'parses the json into an Array of Hashes' do
      expect(@science.json.first).to be_a Hash
    end
  end

  describe '#determine_cohort_names' do
    it 'returns an Array' do
      expect(@test_science.determine_cohort_names).to be_an Array
    end

    it 'has only A and B values for Cohort names' do
      expect(@test_science.determine_cohort_names).to contain_exactly('A', 'B')
    end
  end

  describe '#select_cohort_data' do
    it 'returns an Array' do
      expect(@test_science.select_cohort_data('A')).to be_a Array
    end

    it 'returns the proper number of cohort members' do
      expect(@test_science.select_cohort_data('A').count).to eq(49)
    end
  end

  describe '#create_cohorts' do
    it 'returns an Array' do
      @science.create_cohorts
      expect(@science.cohorts).to be_an Array
    end

    it 'should return an array of as many cohorts as the data requires' do
      @science.create_cohorts
      expect(@science.cohorts.length).to eq(2)
    end

    it 'creates an array of Cohort objects' do
      @science.create_cohorts
      expect(@science.cohorts.all? { |x| x.is_a? Cohort }).to be true
    end
  end

  describe '#chi_squared' do
    it 'returns a float' do
      @science.create_cohorts
      expect(@science.chi_squared).to be_a Float
    end

    it 'takes two or more cohorts and returns a chi-squared p-value' do
      @science.create_cohorts
      expect(@science.chi_squared.round(4)).to eq(0.0395)
    end
  end

  describe '#gtest_score' do

    it 'returns a float' do
      @science.create_cohorts
      expect(@science.chi_squared).to be_a Float
    end

    it 'takes two or more cohorts and returns a gtest-score p-value' do
      @science.create_cohorts
      expect(@science.gtest_score.round(4)).to eq(2.1503)
    end
  end

end
