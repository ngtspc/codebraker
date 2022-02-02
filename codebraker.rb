class Codebraker
  attr_reader :generated_number
  attr_accessor :entered_number

  def initialize(generated_number = rand(1_000..10_000), entered_number = 0)
    @generated_number = generated_number
    @entered_number = entered_number
  end

  def wrong_input_defence(entered_number)
    until entered_number.to_s.length == 4
      p 'Please double-check your number'
      entered_number = gets.chomp.to_i
    end
    entered_number
  end

  def compare(entered_number)
    i = 0
    hiden_number = []
    converted_entered_number = entered_number.to_s.split('')
    converted_generated_number = @generated_number.to_s.split('')
    converted_generated_number.each do |element|
      compare_numbers(element, i, hiden_number, converted_entered_number)
      i += 1
    end
    p hiden_number.join('')
  end

  def compare_numbers(element, i, hiden_number, converted_entered_number)
    if converted_entered_number[i] == element
      hiden_number.push('+')
    elsif converted_entered_number.include?(element)
      hiden_number.push('-')
    else
      hiden_number.push('*')
    end
  end

  def check(entered_number)
    entered_number = wrong_input_defence(entered_number)
    compare(entered_number)
  end
end
