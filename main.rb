# frozen_string_literal: true

require_relative 'codebraker'

# Explanation/Description of Main class
class Main
  attr_accessor :current_attempts

  def initialize(current_attempts = 0)
    @codebraker = Codebraker.new
    @current_attempts = current_attempts
  end

  def greeting
    p 'Welcome to our game, kid. I have thought of a number. Can you guess what the number is?'
    p 'How many attempts do you need to win the game?'
  end

  def counter
    p "You have #{@current_attempts -= 1} attempt(s) left!"
  end

  def won_game(hiden_number)
    p 'Congrats! You won the game, kid!' if hiden_number == '++++'
  end

  def game_over(hiden_number)
    p 'Game over' if hiden_number != @number && @current_attempts.zero?
  end

  def choose_attempts_number
    @current_attempts = gets.chomp.to_i
    p "Ok. You have #{@current_attempts} attempts. Show what you can do!"
  end

  def enter_number
    p 'Please enter your number'
    gets.chomp.to_i
  end

  # def wrong_input_defence(entered_number)
  #   until entered_number.to_s.length == 4
  #     p 'Please double-check your number'
  #     entered_number = gets.chomp.to_i
  #   end
  #   entered_number
  # end

  def run
    greeting
    choose_attempts_number
    current_attempts.times do
      entered_number = enter_number
      # wrong_input_defence(entered_number)
      hiden_number = @codebraker.check(entered_number)
      return if won_game(hiden_number)

      counter
      game_over(hiden_number)
    end
  end
end

main = Main.new
main.run
