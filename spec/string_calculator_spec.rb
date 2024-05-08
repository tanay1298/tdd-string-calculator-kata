require 'rails_helper'
require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do

    let(:calculator) { StringCalculator.new }

    describe '#add_string' do 
        it 'returns 0 for an empty string' do
            expect(calculator.add('')).to eq(0)
        end

        it 'returns the number for a single number' do
            expect(calculator.add('1')).to eq(1)
        end
    end
    

end