require_relative '../lib/calculator.rb'

describe Calculator do
  # this test was done before converting strings to float
  # it 'returns the string into separate string seperated by a space' do
  #   calculator = Calculator.new
  #   expect(calculator.tokenize("2")).to eq(["2"])
  #   expect(calculator.tokenize("2.56")).to eq(["2.56"])
  #   expect(calculator.tokenize("2 + 5")).to eq(["2", "+", "5"])
  #   expect(calculator.tokenize("2.5 + 1.5")).to eq(["2.5", "+", "1.5"])
  # end

  it 'converts number strings to number' do
    calculator = Calculator.new
    expect(calculator.tokenize("2 + 3 + 8")).to eq([2, "+", 3, "+", 8])
  end

  it 'calculates the first two numbers' do
    calculator = Calculator.new
    expect(calculator.operation(2.0, "+" , 4.0)).to eq(6.0)
    expect(calculator.operation(10.0, "-", 3.0)).to eq(7.0)
    expect(calculator.operation(9.0, "/", 3.0)).to eq(3.0)
    expect(calculator.operation(10.0, "*", 3.0)).to eq(30.0)
    expect(calculator.operation(5.0, "-", 10.0)).to eq(-5.0)
  end

  it 'calculates input of 2 numbers from string' do
    calculator = Calculator.new
    calculator.tokenize("2 + 1")
    expect(calculator.calculate).to eq(3)
    calculator.tokenize("6 / 3")
    expect(calculator.calculate).to eq(2)
    calculator.tokenize("7 * 9")
    expect(calculator.calculate).to eq(63)
    calculator.tokenize("8 - 1")
    expect(calculator.calculate).to eq(7)
  end

  it 'calculates 3 numbers' do
    calculator = Calculator.new
    calculator.tokenize("8 + 9 / 3")
    expect(calculator.calculate).to eq(11)
  end

  it 'calculates division as a first priority' do
    calculator = Calculator.new
    calculator.tokenize("8 / 2 / 2")
    expect(calculator.calculate).to eq(2)
  end

  it 'returns calculated result' do
    calculator = Calculator.new

    calculator.tokenize("8 + 2 * 20 / 4 - 2")
    expect(calculator.calculate).to eq(16)

    calculator.tokenize("4 / 2 + 8 * 7")
    expect(calculator.calculate).to eq(58)

    calculator.tokenize("2 + 5")
    expect(calculator.calculate).to eq(7)

    calculator.tokenize("2 - 5")
    expect(calculator.calculate).to eq(-3)

    calculator.tokenize("10 / 5")
    expect(calculator.calculate).to eq(2)

    calculator.tokenize("7 + 5")
    expect(calculator.calculate).to eq(12)
  end
end
