class StringCalculator
    def add(string)
        if string.empty?
            0
        elsif /,\n|,\z|\n,|\n\z/.match?(string)
            raise ArgumentError, "Invalid input"
        else
            string.gsub('\n', ',').split(',').map(&:to_i).sum
        end
    end
end





