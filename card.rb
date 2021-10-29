class Card
    attr_reader :card_value
    
    def initialize(letter)
        @face_up = false
        @card_value = letter
    
    end

    def hidden?
        !@face_up
    end

    def hide
        @face_up = false
    end

    def show
        @face_up = true
    end

    def ==(other_value)
        @card_value == other_value
    end

end