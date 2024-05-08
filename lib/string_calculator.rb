class StringCalculator
    def add(string)
        if string.empty?
            0
        else
            string.gsub('\n', ',').split(',').map(&:to_i).sum
        end
    end
end
