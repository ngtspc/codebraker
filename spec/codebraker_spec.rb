# frozen_string_literal: true

require 'rspec'
require_relative 'codebraker'

describe 'Codebraker' do
  it 'will check if I can won the game' do
    generated_number = %w[4231 4231 4231 4231 4231 4231 4231 4231 4231 4231 4231 4231 4231 4231 5833 9211 5866 4902]
    entered_numbers =  %w[0000 4231 0001 0031 0231 4230 4000 0400 0402 3402 3412 0412 2051 3850 5058 4959 6985 3029]
    expected_result =  %w[**** ++++ ***+ **++ *+++ +++* +*** -*** --** ---* ---- --*- *-*+ **-* +-** -*** ---- *---]
    input_datas = [generated_number, entered_numbers, expected_result]

    i = 0
    input_datas[1].each do |entered_number|
      expect(Codebraker.new(input_datas[0][i]).check(entered_number)).to eq(input_datas[-1][i])
      i += 1
    end
  end
end
