require_relative 'codebraker'
require_relative 'cli'

class Main
  attr_accessor :current_attempts

  def initialize
    @codebraker = Codebraker.new
  end

  def run
    CLI.greeting
    current_attempts = CLI.choose_attempts_number
    current_attempts.times do
      entered_number = Codebraker.enter_number
      hidden_number = @codebraker.check(entered_number)
      CLI.decrease_attempts_counter
      if CLI.won_game?(hidden_number)
        break
      else
        CLI.game_over
      end
    end
  end
end

main = Main.new
main.run
