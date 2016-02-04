require "colourcard/version"
require "colourcard/colour_patch"
require "colourcard/colour_card"
require 'png'
require 'thor'

module ColourCard
    class ColourCard::App < Thor
        desc "generate", "generate a random colour card in PNG format"
        method_option :across,       type: :numeric, default: 8,                desc: 'how many horizontal patches'
        method_option :down,         type: :numeric, default: 5,                desc: 'how many vertical patches'
        method_option :patch_width,  type: :numeric, default: 30,               desc: 'width of each patch'
        method_option :patch_height, type: :numeric, default: 30,               desc: 'height of each patch'
        method_option :spacing,      type: :string,  default: 'auto',           desc: 'height of each patch'
        method_option :output,       type: :string,  default: 'colourcard.png', desc: 'filename to save card to (PNG only)'
        def generate
            spacing = options[:spacing]
            if options[:spacing] == 'auto'
                spacing = options[:width].to_i/options[:across].to_i
            end
            spacing = spacing.to_i
            colour_card = ColourCard::Card.new({
                :across         => options[:across],
                :down           => options[:down],
                :patch_width    => options[:patch_width],
                :patch_height   => options[:patch_height],
                :spacing        => spacing,
            })
            png = PNG.new(colour_card)
            png.save(options[:output])
        end
    end
end
