require 'parser.rb'
require 'json'

describe 'Parser' do
  let(:parser) { Parser.new('spec/test_data.json') }
  let(:cohort) { "A" }

  it "separates data into specific cohort" do
    expect(parser.separate_groups(cohort)).to match_array(
      [{ "date" => "2014-05-19", "cohort" => "A", "result" => 1 },
       { "date" => "2014-05-19", "cohort" => "A", "result" => 1 },
       { "date" => "2014-05-19", "cohort" => "A", "result" => 0 }]
    )
  end
end
