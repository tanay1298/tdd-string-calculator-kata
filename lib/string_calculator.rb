class StringCalculator
    def add(string)
        if string.empty?
            0
        elsif /,\n|,\z|\n,|\n\z/.match?(string)
            raise ArgumentError, "Invalid input"
        else
            if string.start_with?("//")
                delimiter, numbers = string[2..-1].split("\n")
                numbers = numbers.split(delimiter).map(&:to_i)
            else
                numbers = string.gsub('\n', ',').split(',').map(&:to_i)
            end
            negative_numbers = numbers.select { |num| num < 0 }
            if negative_numbers.any?
                raise RuntimeError, "negative numbers not allowed: #{negative_numbers.join(", ")}"
            else
                numbers.sum
            end
        end
    end
end
