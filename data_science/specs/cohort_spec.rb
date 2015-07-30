require 'rspec'
require 'json'
require_relative '../cohort.rb'

RSpec.describe 'Cohort' do
  let (:test_data) { JSON.parse(File.read('../test_data.json')) }
  let (:cohort_a) { test_data.select { |v| v['cohort'] == 'A' } }

  before :each do
    @cohort = Cohort.new(name: 'A', data: cohort_a)
  end

  describe '#new' do
    it 'returns a new Cohort object' do
      expect(@cohort).to be_an_instance_of Cohort
    end

    it 'initializes with a string for a name' do
      expect(Cohort.new.name).to be_a String
    end

    it 'initializes with an array of data' do
      expect(Cohort.new.data).to be_a Array
    end

    it 'initializes with an empty data array' do
      expect(Cohort.new.data).to be_empty
    end

    it 'initializes with an empty string for a name' do
      expect(Cohort.new.name).to be_empty
    end

    it 'accepts a string as a name' do
      expect(@cohort.name).to eq('A')
    end

    it 'accepts parsed JSON data' do
      expect(@cohort.data).to_not be_empty
    end

    it 'returns an array of data' do
      expect(@cohort.data).to be_a Array
    end

    it 'returns an array of Hashes' do
      expect(@cohort.data.all? { |x| x.is_a? Hash }).to be true
    end
  end

  describe '#dates' do
    it 'returns an array' do
      expect(@cohort.dates).to be_a Array
    end

    it 'returns an array of Date Objects' do
      expect(@cohort.dates.all? { |x| x.is_a? Date }).to be true
    end
  end

  describe '#results' do
    it 'returns an array' do
      expect(@cohort.results).to be_a Array
    end

    it 'returns an array of integers' do
      expect(@cohort.results.all? { |x| x.is_a? Integer }).to be true
    end
  end

  describe '#conversions' do
    it 'returns an Integer' do
      expect(@cohort.conversions).to be_a Integer
    end

    it 'returns the correct number of conversions' do
      expect(@cohort.conversions).to eq(3)
    end
  end

  describe '#non_conversions' do
    it 'returns an Integer' do
      expect(@cohort.non_conversions).to be_a Integer
    end

    it 'returns the correct number of non-conversions' do
      expect(@cohort.non_conversions).to eq(46)
    end
  end

  describe '#total_sample_size' do
    it 'returns an Integer' do
      expect(@cohort.total_sample_size).to be_a Integer
    end

    it 'returns the correct number of visitors' do
      expect(@cohort.total_sample_size).to eq(49)
    end
  end
end
