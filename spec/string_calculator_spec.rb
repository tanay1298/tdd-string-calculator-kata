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

        it 'returns the sum of two numbers' do
            expect(calculator.add('1,2')).to eq(3)
        end

        it 'handles new lines between numbers' do
            expect(calculator.add('1\n2,3')).to eq(6)
        end

        it 'returns an error for invalid input' do
            expect { calculator.add("1,\n") }.to raise_error(ArgumentError)
        end

        it 'handles specific regex with delim provided' do
            expect(calculator.add("//;\n1;2")).to eq(3)
        end

        it 'throws an exception for negative numbers' do
            expect { calculator.add("-1") }.to raise_error(RuntimeError, "negative numbers not allowed: -1")
        end

        it 'throws an exception for multiple negative numbers' do
            expect { calculator.add("-1,-2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed: -1, -2, -3")
        end

    end
    

end