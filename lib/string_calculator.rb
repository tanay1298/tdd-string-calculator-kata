class StringCalculator
    def add(string)
        if string.empty?
            0
        else
            string.split(',').map(&:to_i).sum
        end
    end
end
