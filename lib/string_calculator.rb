class StringCalculator
    def add(string)
        if string.empty?
            0
        elsif /,\n|,\z|\n,|\n\z/.match?(string)
            raise ArgumentError, "Invalid input"
        elsif string.start_with?("//")
            delimiter, numbers = string[2..-1].split("\n")
            numbers.split(delimiter).map(&:to_i).sum
        else
            string.gsub('\n', ',').split(',').map(&:to_i).sum
        end
    end
end
