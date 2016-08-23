require 'cohort.rb'

describe 'Cohort' do
  group = [{ "date" => "2014-05-19", "cohort" => "A", "result" => 1 },
           { "date" => "2014-05-19", "cohort" => "A", "result" => 1 },
           { "date" => "2014-05-19", "cohort" => "A", "result" => 0 }]

  let(:cohort) { Cohort.new(group) }

  it "calculates sample size of a cohort" do
    x = cohort.size
    expect(x).to eq(3)
  end

  it "calculates conversion rate of a cohort" do
    expect(cohort.conversion_rate).to eq(66.66666666666666)
  end

  it "calculates standard error of a cohort" do
    expect(cohort.standard_error).to eq(0.6666666666666667)
  end
end
