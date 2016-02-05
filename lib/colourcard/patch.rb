require 'png'

module ColourCard
    class ColourCard::Patch < PNG::Canvas
        def initialize(options = {})
            colour = options[:colour] || random_colour
            @erase = options[:erase]  || colour
            super(
                options[:width] || 10,
                options[:height] || 10,
                colour
            )
            border
        end
    private
        def random_colour(alpha = 0xFF)
            PNG::Color.new(rand(0xFF),rand(0xFF), rand(0xFF), alpha)
        end

        def border
            line(0,0,width-1,0,@erase)               # top
            line(0,height-1,width-1,height-1,@erase) # bottom
            line(0,0,0,height-1,@erase)              # left
            line(width-1,0,width-1,height-1,@erase)  # right
        end
    end
end
