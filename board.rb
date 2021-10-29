require_relative "card.rb"

class Board
    def initialize(num_pairs=8)
        
        @grid = Array.new(4){Array.new(4,nil)}
        @alpha = ("A".."Z").to_a
        @cards = []
        (0...num_pairs).each do |i|
            2.times do
                @cards << Card.new(@alpha[i])
            end
        end
        @cards = @cards.shuffle
        populate
    end

    def populate
        i=0
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |ele|
                @grid[row][ele] = @cards[i]
                i += 1
            end
        end
    end

    def render
        #system("clear")
        puts "  0 1 2 3"
        @grid.each_with_index do |row, i|
            print "#{i} "
            print row.map{|c| c.hidden? ? " " : c.card_value}.join(' ')
            puts
        end

    end

    def won?
        @cards.all?{|card| !card.hidden?}
    end

    def reveal(guessed_pos)
        #p guessed_pos
        if valid_pos?(guessed_pos)
            @grid[guessed_pos[1]][guessed_pos[0]].show
        else
            puts "not valid position"
        end
    end

    def unreveal(guessed_pos)
        if valid_pos?(guessed_pos)
            @grid[guessed_pos[1]][guessed_pos[0]].hide
        else
            puts "not valid position"
        end    end

    def valid_pos?(pos)
        if pos.length != 2
            return false
        elsif pos[0] > @grid.length || pos[1]> @grid.length
            return false
        else
            return true
        end

    end

    def [](pos)
        @grid[pos[1]][pos[0]].card_value
    end

    def []=(pos, val)
        @grid[pos[1]][pos[0]] = val
    end
end 