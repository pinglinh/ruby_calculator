class Calculator
  def tokenize(input)
    @split_input = input.split(/\s+/)

    @split_input.map! do |token|
        Float(token) rescue token
    end
  end

  def operation(a, operator, b)
    raise "Expected A and B to be numbers" unless a.is_a?(Float) and b.is_a?(Float)
    case operator
      when "+"
        a + b
      when "-"
        a - b
      when "*"
        a * b
      when "/"
        a / b
      else
        raise "Unknown operator #{op}"
    end
  end

  def calculate
    # we have to do a while loop which checks for / constantly otherwise it will stop checking after it has found the first /
    while @split_input.include?("/") do
      @split_input.each_with_index do |x, index|
        if x == "/"
          result = operation(@split_input[index-1], @split_input[index], @split_input[index+1])
          # replaces the operator into the result we got from the operation calculation
          # eg. 2 * 3 = 6 ... so * will now equal 6 and we get '2 6 3'
          @split_input[index] = result
          @split_input.delete_at(index+1)
          @split_input.delete_at(index-1)
        end
      end
    end

    while @split_input.include?("*") do
      @split_input.each_with_index do |x, index|
        if x == "*"
          result = operation(@split_input[index-1], @split_input[index], @split_input[index+1])
          @split_input[index] = result
          @split_input.delete_at(index+1)
          @split_input.delete_at(index-1)
        end
      end
    end

    while @split_input.include?("+") do
      @split_input.each_with_index do |x, index|
        if x == "+"
          result = operation(@split_input[index-1], @split_input[index], @split_input[index+1])
          @split_input[index] = result
          @split_input.delete_at(index+1)
          @split_input.delete_at(index-1)
        end
      end
    end

    while @split_input.include?("-") do
      @split_input.each_with_index do |x, index|
        if x == "-"
          result = operation(@split_input[index-1], @split_input[index], @split_input[index+1])
          @split_input[index] = result
          @split_input.delete_at(index+1)
          @split_input.delete_at(index-1)
        end
      end
    end

    @split_input[0]
  end
end
