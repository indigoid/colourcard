require "colourcard/version"
require "colourcard/patch"
require "colourcard/card"
require "colourcard/file"
require 'png'
require 'thor'

module ColourCard
    class ColourCard::App < Thor
        desc "generate", "generate a colour card in PNG format"
        method_option :across,       type: :numeric, default: 8,                desc: 'how many horizontal patches'
        method_option :down,         type: :numeric, default: 5,                desc: 'how many vertical patches'
        method_option :patch_width,  type: :numeric, default: 30,               desc: 'width of each patch'
        method_option :patch_height, type: :numeric, default: 30,               desc: 'height of each patch'
        method_option :spacing,      type: :string,  default: 'auto',           desc: 'height of each patch'
        method_option :output,       type: :string,  default: 'colourcard.png', desc: 'filename to save card to (PNG only)'
        method_option :input,        type: :string,                             desc: 'filename to read patch colours from'
        method_option :random,       type: :boolean, default: true,             desc: 'choose colours randomly without an input file'
        def generate
            spacing = options[:spacing]
            if options[:spacing] == 'auto'
                spacing = options[:width].to_i/options[:across].to_i
            end
            spacing = spacing.to_i
            colours = nil
            if options[:input]
                file_colours = ColourCard::File.new
                file_colours.load(
                    options[:input],
                    options[:across] * options[:down],
                    PNG::Color.new(0xFF,0xFF,0xFF,0x7F),
                )
            end
            colour_card = ColourCard::Card.new({
                :across         => options[:across],
                :down           => options[:down],
                :patch_width    => options[:patch_width],
                :patch_height   => options[:patch_height],
                :spacing        => spacing,
                :colours        => file_colours || nil,
            })
            png = PNG.new(colour_card)
            png.save(options[:output])
        end
        
        desc 'version', 'displays the version of Colourcard invoked'
        def version
          puts "colourcard #{Colourcard::VERSION}"
        end
    end
end
