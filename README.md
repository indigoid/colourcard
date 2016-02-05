# Colourcard

Generate colour cards in PNG format, with colours specified in a file or chosen at random.

## Installation

    $ gem install colourcard

## Usage

    $ colourcard help generate

The simplest invocation generates a random card:

    $ colourcard generate

Colourcard now supports reading colours from a file, including (optionally) the alpha channel value. The file format is very simple, just one patch specified per line, starting at top left and proceeding to the bottom right, row by row.

The below Ruby code was used to generate the supplied sample input3x3.txt:

    puts (0..8).map { |x| (0..2).map { |y| 16-(y*2) + x*(0xFF/(9+(y*2))) }.join(" ") }.join("\n")

If there are insufficient rows in the input file to fill all of the patches on the colour card, the remainder will be filled with a dark grey.

    $ colourcard generate --input input.txt

As mentioned above, the input file can also specify the alpha channel value for each patch. The below Ruby code is similar to that above but emits an alpha value as well; this was used to generate the supplied sample input3x3a.txt:

    puts (0..8).map { |x| (0..3).map { |y| 16-(y*2) + x*(0xFF/(9+(y*2))) }.join(" ") }.join("\n")

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/indigoid/colourcard.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

