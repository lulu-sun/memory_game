
class Player

    def initialize(name)
        @player_name = name
    end


    def prompt_guess
        puts ">> please input your guess as four numbers, like this: 0 1, 2 3"

        @guess = gets.chomp.split((","))

        @first_guess = @guess[0].split(" ").map(&:to_i)
        @second_guess = @guess[1].split(" ").map(&:to_i)

        if !@current_game.valid_pos?(@first_guess) || @correct_guesses.include?(@first_guess)
            puts "not valid input or already guessed, try again"
            prompt_guess
        elsif @first_guess == @second_guess
            puts "re-guess, please try again"
            prompt_guess
        elsif !@current_game.valid_pos?(@first_guess)
            puts "out of bounds, please try again"
            prompt_guess
        end

        return @first_guess + @second_guess

    end

end