require 'rspec/autorun'

class Example
  def calculate(num)
    num / 3 - 2
  end
end

RSpec.describe Example do
  it 'calculates expression' do
    example = Example.new

    expect(example.calculate(12)).to eq(2)
    expect(example.calculate(14)).to eq(2)
    expect(example.calculate(1969)).to eq(654)
    expect(example.calculate(100756)).to eq(33583)
  end
end

