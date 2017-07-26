require_relative "calculator"

class CalculatorInterface

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
  end

  def read_line
    @input.readline.chomp
  end

  def prompt_message
    @output.puts "Welcome. I am a calculator based on BODMAS. Type your calculation and I will calculator it for you"
  end

  def CALCULATE
      calculator = Calculator.new
      calculator.tokenize(read_line)
      answer = calculator.calculate
      return_line(answer)
  end

  def return_line(answer)
    @output.puts answer
  end
end
