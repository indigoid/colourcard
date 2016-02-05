require 'png'

module ColourCard
    class ColourCard::Card < PNG::Canvas
        def initialize(options = {})
            @across       = options[:across]       || 8
            @down         = options[:down]         || 5
            @patch_width  = options[:patch_width]  || 30
            @patch_height = options[:patch_height] || 30
            background    = options[:background]   || PNG::Color.new(0,0,0,0xFF)
            @spacing      = options[:spacing]      || 2
            @colours      = options[:colours]
            card_width    = (@patch_width * @across) + (@spacing * (@across+1))
            card_height   = (@patch_height * @down)  + (@spacing * (@down+1))

            super(card_width, card_height, background)
            render
        end
        def render
            (0..@down-1).reverse_each do |y|
                (0..@across-1).each do |x|
                    patch = ColourCard::Patch.new({
                        :width  => @patch_width,
                        :height => @patch_height,
                        :colour => @colours ? @colours.shift : nil,
                    })
                    composite(
                        patch,
                        (x*@patch_width) + (x+1)*@spacing,
                        (y*@patch_height) + (y+1)*@spacing,
                        :overwrite
                    )
                end
            end
        end
    end
end
