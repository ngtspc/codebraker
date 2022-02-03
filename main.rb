require_relative 'codebraker'
require_relative 'cli'

class Main
  attr_accessor :attempts_count

  def initialize(attempts_count = 0)
    @codebraker = Codebraker.new
    @attempts_count = attempts_count
  end

  def run
    CLI.greeting
    @attempts_count = CLI.choose_attempts_number
    (@attempts_count - 1).downto(0) do |current_attempt|
      hidden_number = @codebraker.check(Codebraker.enter_number)
      return if CLI.won_game?(hidden_number)

      CLI.show_attempts(current_attempt)
    end
    CLI.game_over?
  end
end

main = Main.new
main.run
