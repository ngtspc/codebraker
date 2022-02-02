require_relative 'codebraker'
require_relative 'interface'

class Main
  include Interface
  attr_accessor :current_attempts

  def initialize(current_attempts = 0)
    @codebraker = Codebraker.new
    @current_attempts = current_attempts
  end

  def run
    greeting
    choose_attempts_number
    current_attempts.times do
      entered_number = enter_number
      hiden_number = @codebraker.check(entered_number)
      return if won_game(hiden_number)
      counter
      game_over(hiden_number)
    end
  end
end

main = Main.new
main.run
