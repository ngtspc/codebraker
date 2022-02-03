class CLI

  def self.greeting
    p 'Welcome to our game, kid. I have thought of a number. Can you guess what the number is?'
    p 'How many attempts do you need to win the game?'
  end

  def self.decrease_attempts_counter(current_attempts)
    p "You have #{current_attempts -= 1} attempt(s) left!"
    current_attempts
  end

  def self.won_game?(hidden_number)
    if hidden_number == '++++'
      p 'Congrats! You won the game, kid!' 
    end
  end

  def self.game_over?(current_attempts)
    p 'Game over' if current_attempts.zero?
  end

  def self.choose_attempts_number
    current_attempts = gets.chomp.to_i
    p "Ok. You have #{current_attempts} attempts. Show what you can do!"
    current_attempts
  end
end
