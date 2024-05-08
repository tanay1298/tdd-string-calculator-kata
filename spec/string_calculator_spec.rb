RSpec.describe StringCalculator do

    describe '#add_string' do 
        it 'returns 0 for an empty string' do
            expect(StringCalculator.new.add('')).to eq(0)
        end
    end

end