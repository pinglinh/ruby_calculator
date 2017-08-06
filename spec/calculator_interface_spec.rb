require_relative '../lib/calculator_interface'
require 'stringio'

describe CalculatorInterface do
  it 'should read user input' do
    input = StringIO.new("hello\n")
    user_input = CalculatorInterface.new(input)
    expect(user_input.read_line).to eq("hello")
  end

  it "should return user input" do
    output = StringIO.new
    user_output = CalculatorInterface.new(nil, output)
    user_output.return_line("hello\n")
    expect(output.string).to eq("hello\n")
  end

  it "should read user input, calculate user input and print the answer" do
    input = StringIO.new("2 + 2\n")
    output = StringIO.new
    calculator_interface = CalculatorInterface.new(input, output)
    calculator_interface.CALCULATE
    expect(output.string).to eq(
      "Welcome. I am a calculator based on BODMAS. Type your calculation and I will calculator it for you\n" +
      "4.0\n")
  end

  it "should print a prompt message" do
    output = StringIO.new
    calculator_interface = CalculatorInterface.new(nil, output)
    calculator_interface.prompt_message
    expect(output.string).to eq("Welcome. I am a calculator based on BODMAS. Type your calculation and I will calculator it for you\n")
  end
end
