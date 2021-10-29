require_relative "board.rb"
require_relative "card.rb"
require_relative "player.rb"

class Game
    attr_reader :current_game
    def initialize(player_name)
        @player_array = []
        @player_array << Player.new(player_name)
        @current_game = Board.new
        
        @second_guess = []
        @correct_guesses = []

        @current_player = @player_array[0]

    end

    def play
        @current_game.render

        while !@current_game.won?
            
            @player_guess = @current_player.prompt_guess
            

            if !match?(@first_guess, @second_guess)
                @current_game.render
                sleep(2)
                dont_match
            else
                @correct_guesses += [@first_guess, @second_guess]
                puts "correct guesses are: #{@correct_guesses}"
                puts ">> Nice match"
            end

            system("clear")

            @current_game.render
            @player_array.rotate
        end

        puts "YOU WIN"
    end


    def make_guess(positions)
        
        @first_guess = @positions[0..1]
        @second_guess = @positions[2..3]

        @current_game.reveal(@first_guess)
        @current_game.reveal(@second_guess)

    end

    def match?(pos1, pos2)
        @current_game[pos1] == @current_game[pos2]
    end

    def dont_match
        puts ">> They don't match"
        @current_game.unreveal(@first_guess)
        @current_game.unreveal(@second_guess)
        @current_game.render
    end

end


test = Game.new
test.play