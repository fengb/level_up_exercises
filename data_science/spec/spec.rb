require 'calculator.rb'
require 'parser.rb'

describe 'Calculator' do
  let(:parser) { Parser.new('spec/test_data.json') }
  let(:data_export) { parser.json_parse }
  let(:group_a) { parser.group_a }
  let(:group_b) { parser.group_b }
  let(:calculator) { Calculator.new(data_export, group_a, group_b) }

  it "calculates sample size of each cohort" do
    x = calculator.cohort_size(group_a)
    expect(x).to eq(3)
  end

  it "calculates conversion rate of each cohort" do
    expect(calculator.conversion_rate(group_a)).to eq(66.67)
  end

  it "calculates standard error of each cohort" do
    expect(calculator.standard_error(group_a)).to eq(0.67)
  end
end
