require 'png'
require 'png/font'

module ColourCard
    class ColourCard::Patch < PNG::Canvas
        def initialize(options = {})
            colour = options[:colour] || random_colour
            desc   = options[:desc]   || nil
            @erase = options[:erase]  || colour
            width  = options[:width]  || 10
            height = options[:height] || 10
            super(width, height, colour)
            puts "(#{width/2},#{height/2}) using description: #{desc}"
            annotate(desc,width/2,height/2,PNG::Font.default,:center) if desc
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
