class StringCalculator
  INVALID_INPUT_MESSAGE = 'Invalid input'.freeze
  NEGATIVES_ERROR_MESSAGE = 'negative numbers not allowed'.freeze
  MAX_ALLOWED_NUMBER = 1000
  MULTIPLY_DELIMITER = '*'

  def add(string)
    return 0 if string.empty?
    validate_input(string)
    numbers, is_multiply = extract_numbers(string)
    validate_negatives(numbers)
    numbers = filter_numbers(numbers)
    return multiply_numbers(numbers) if is_multiply
    numbers.sum
  end

  private

  def validate_input(string)
    raise ArgumentError, INVALID_INPUT_MESSAGE if /,\n|,\z|\n,|\n\z/.match?(string)
  end

  def extract_numbers(string)
    is_multiply = false
    if string.start_with?("//")
      delimiter, numbers = string[2..-1].split("\n")
      if delimiter == '*'
        is_multiply = true
      end
      delimiters = delimiter.scan(/\[(.*?)\]/).flatten
      delimiters = delimiters.empty? ? [delimiter] : delimiters
      numbers = delimiters.reduce(numbers) { |str, del| str.gsub(del, ',') }.split(',').map(&:to_i)
    else
      numbers = string.gsub('\n', ',').split(',').map(&:to_i)
    end
    return numbers, is_multiply
  end

  def validate_negatives(numbers)
    negative_numbers = numbers.select { |num| num < 0 }
    raise RuntimeError, "#{NEGATIVES_ERROR_MESSAGE}: #{negative_numbers.join(', ')}" if negative_numbers.any?
  end

  def filter_numbers(numbers)
    numbers.select { |num| num <= MAX_ALLOWED_NUMBER }
  end

  def multiply_numbers(numbers)
    numbers.reduce(1) { |product, x| product * x }
  end

end
